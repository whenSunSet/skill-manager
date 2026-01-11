#!/bin/bash

# Commit Skill Changes Script
# Commits and optionally pushes skill changes to GitHub

set -e

# Colors (consistent with existing scripts)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get current directory
SKILL_DIR="$(pwd)"
SKILL_NAME="$(basename "$SKILL_DIR")"

echo -e "${BLUE}📝 Commit Skill Changes${NC}"
echo ""
echo "Skill: $SKILL_NAME"
echo "Location: $SKILL_DIR"
echo ""

# Check if it's a git repository
if [ ! -d "$SKILL_DIR/.git" ]; then
    echo -e "${RED}✗ Not a git repository${NC}"
    echo ""
    echo "Please initialize git first:"
    echo "  git init"
    exit 1
fi

# Check for changes
if git -C "$SKILL_DIR" diff --quiet HEAD && git -C "$SKILL_DIR" diff --quiet --cached; then
    echo -e "${YELLOW}⚠ No changes to commit${NC}"
    echo ""
    echo "Working directory is clean. Nothing to commit."
    exit 0
fi

# Show git status
echo "📊 Git Status"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
git -C "$SKILL_DIR" status -s
echo ""

# Ask to view diff
read -p "View detailed diff? (y/N): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo "📝 Git Diff"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    git -C "$SKILL_DIR" diff
    echo ""
fi

# Generate default commit message
generate_commit_message() {
    local changed_files=$(git -C "$SKILL_DIR" diff --name-only HEAD)
    local msg="Update $SKILL_NAME"

    # Generate more specific message based on changed files
    if echo "$changed_files" | grep -q "SKILL.md"; then
        msg="$msg: update skill documentation"
    fi

    if echo "$changed_files" | grep -q "^scripts/"; then
        msg="$msg: update scripts"
    fi

    if echo "$changed_files" | grep -q "^examples/"; then
        msg="$msg: update examples"
    fi

    if echo "$changed_files" | grep -q "^references/"; then
        msg="$msg: update references"
    fi

    DEFAULT_COMMIT_MSG="$msg"
}

generate_commit_message

echo "📝 Commit Message"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Default commit message:"
echo -e "  ${YELLOW}$DEFAULT_COMMIT_MSG${NC}"
echo ""
read -p "Use default message? (Y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Nn]$ ]]; then
    read -p "Enter custom commit message: " CUSTOM_MSG
    COMMIT_MSG="${CUSTOM_MSG:-$DEFAULT_COMMIT_MSG}"
else
    COMMIT_MSG="$DEFAULT_COMMIT_MSG"
fi

# Commit changes
echo ""
echo "🔧 Committing changes..."
git -C "$SKILL_DIR" add .
git -C "$SKILL_DIR" commit -m "$COMMIT_MSG"
echo -e "${GREEN}✓ Changes committed${NC}"

# Ask to push
echo ""
read -p "📤 Push to GitHub? (y/N): " -n 1 -r
echo ""
PUSH_CHOICE=$REPLY

if [[ $PUSH_CHOICE =~ ^[Yy]$ ]]; then
    # Check if remote exists
    if ! git -C "$SKILL_DIR" remote get-url origin &> /dev/null; then
        echo -e "${YELLOW}⚠ No GitHub remote found${NC}"
        echo ""
        echo "This skill hasn't been uploaded to GitHub yet."
        echo "Use upload-to-github.sh to set up GitHub repository."
        exit 0
    fi

    echo "Pushing to GitHub..."
    if git -C "$SKILL_DIR" push; then
        echo -e "${GREEN}✓ Pushed to GitHub${NC}"
        PUSHED=true
    else
        echo -e "${RED}✗ Push failed${NC}"
        echo ""
        echo "Possible reasons:"
        echo "  - Network connection issues"
        echo "  - Authentication required"
        echo "  - Repository URL changed"
        echo ""
        echo "Your changes are committed locally."
        echo "You can push manually later:"
        echo "  cd $SKILL_DIR"
        echo "  git push"
        exit 1
    fi
else
    PUSHED=false
fi

# Show summary
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}✨ Update Complete!${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✓ Changes have been committed locally."
if [ "$PUSHED" = true ]; then
    echo "✓ Changes pushed to GitHub."
else
    echo "ℹ️  Changes NOT pushed to GitHub."
    echo ""
    echo "To push later:"
    echo "  cd $SKILL_DIR"
    echo "  git push"
fi
echo ""
