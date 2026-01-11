#!/bin/bash

# Skill Installation Script
# Automatically installs this skill to Claude Code's local skills directory

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"
SKILL_NAME="$(basename "$SKILL_DIR")"

echo -e "${BLUE}📦 Claude Code Skill Installer${NC}"
echo ""
echo "Skill: $SKILL_NAME"
echo "Location: $SKILL_DIR"
echo ""

# Determine Claude Code skills directory
if [ -n "$CLAUDE_SKILLS_DIR" ]; then
    SKILLS_DIR="$CLAUDE_SKILLS_DIR"
else
    SKILLS_DIR="$HOME/.claude/skills"
fi

# Create skills directory if it doesn't exist
echo "📁 Creating skills directory..."
mkdir -p "$SKILLS_DIR"
echo -e "${GREEN}✓ Skills directory: $SKILLS_DIR${NC}"
echo ""

# Check if skill already exists
if [ -d "$SKILLS_DIR/$SKILL_NAME" ]; then
    echo -e "${YELLOW}⚠ Skill already installed at: $SKILLS_DIR/$SKILL_NAME${NC}"
    echo ""
    read -p "Do you want to overwrite? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 0
    fi
    rm -rf "$SKILLS_DIR/$SKILL_NAME"
fi

# Copy skill to skills directory
echo "📋 Copying skill files..."
cp -r "$SKILL_DIR" "$SKILLS_DIR/"
echo -e "${GREEN}✓ Skill installed to: $SKILLS_DIR/$SKILL_NAME${NC}"
echo ""

# Verify installation
echo "🔍 Verifying installation..."
if [ -f "$SKILLS_DIR/$SKILL_NAME/SKILL.md" ]; then
    echo -e "${GREEN}✓ SKILL.md found${NC}"
else
    echo -e "${YELLOW}⚠ Warning: SKILL.md not found${NC}"
fi

# Check for additional resources
if [ -d "$SKILLS_DIR/$SKILL_NAME/references" ]; then
    REF_COUNT=$(find "$SKILLS_DIR/$SKILL_NAME/references" -type f | wc -l | tr -d ' ')
    echo -e "${GREEN}✓ References: $REF_COUNT file(s)${NC}"
fi

if [ -d "$SKILLS_DIR/$SKILL_NAME/examples" ]; then
    EX_COUNT=$(find "$SKILLS_DIR/$SKILL_NAME/examples" -type f | wc -l | tr -d ' ')
    echo -e "${GREEN}✓ Examples: $EX_COUNT file(s)${NC}"
fi

if [ -d "$SKILLS_DIR/$SKILL_NAME/scripts" ]; then
    SCRIPT_COUNT=$(find "$SKILLS_DIR/$SKILL_NAME/scripts" -type f | wc -l | tr -d ' ')
    echo -e "${GREEN}✓ Scripts: $SCRIPT_COUNT file(s)${NC}"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}✨ Installation Complete!${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📝 Skill installed at: $SKILLS_DIR/$SKILL_NAME"
echo ""
echo "🚀 Next Steps:"
echo "   1. Restart Claude Code or start a new session"
echo "   2. Ask: 'How do I create a skill?'"
echo "   3. The skill should activate automatically"
echo ""
echo "📚 To validate the skill:"
echo "   cd $SKILLS_DIR/$SKILL_NAME"
echo "   ./scripts/validate-skill.sh"
echo ""
echo "❌ To uninstall:"
echo "   rm -rf $SKILLS_DIR/$SKILL_NAME"
echo ""
