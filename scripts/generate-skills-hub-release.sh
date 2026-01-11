#!/bin/bash

##############################################################################
# generate-skills-hub-release.sh
#
# Generate a release post for claudecodeplugins.io Skills Hub
#
# Usage:
#   ./scripts/generate-skills-hub-release.sh /path/to/skill-directory
#
##############################################################################

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_header() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

# Check if skill directory is provided
if [ -z "$1" ]; then
    print_error "Skill directory path is required"
    echo ""
    echo "Usage: $0 /path/to/skill-directory"
    echo ""
    echo "Example:"
    echo "  $0 ~/.claude/skills/my-skill"
    echo "  $0 /path/to/skill-manager"
    exit 1
fi

SKILL_DIR="$1"

# Validate skill directory
if [ ! -d "$SKILL_DIR" ]; then
    print_error "Directory not found: $SKILL_DIR"
    exit 1
fi

# Check for SKILL.md
if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
    print_error "SKILL.md not found in: $SKILL_DIR"
    exit 1
fi

print_success "Found skill directory: $SKILL_DIR"

# Change to skill directory
cd "$SKILL_DIR"

# Extract skill name from SKILL.md frontmatter
SKILL_NAME=$(grep "^name:" SKILL.md | sed 's/^name: *//;s/"//g;s/^[[:space:]]*//;s/[[:space:]]*$//')

if [ -z "$SKILL_NAME" ]; then
    print_error "Could not extract skill name from SKILL.md"
    exit 1
fi

print_success "Skill name: $SKILL_NAME"

# Extract description from SKILL.md
DESCRIPTION=$(sed -n '/^description:/p' SKILL.md | sed 's/^description: *//;s/"//g;s/^[[:space:]]*//;s/[[:space:]]*$//')

# Clean up description (keep first sentence for title)
DESCRIPTION_SHORT=$(echo "$DESCRIPTION" | cut -d'.' -f1 | head -c 100)

# Extract trigger phrases from description
# Look for patterns like: user asks to "phrase 1", "phrase 2"
# Use sed instead of grep -P for macOS compatibility
TRIGGER_PHRASES=$(sed -n 's/.*"create a skill".*/Create a new skill/p; s/.*"write a new skill".*/Write a new skill/p; s/.*"update a skill".*/Update an existing skill/p; s/.*"publish a skill".*/Publish a skill/p' SKILL.md | head -3 | tr '\n' ',' | sed 's/,$//')

# Check for README.md
if [ -f "README.md" ]; then
    # Extract a brief description from README
    README_DESC=$(sed -n '/^>/p' README.md | head -1 | sed 's/^> *//')
    if [ -z "$README_DESC" ]; then
        README_DESC=$(sed -n '2,5p' README.md | head -1)
    fi
fi

# Detect GitHub repository URL
GITHUB_URL=""

# Check git remote
if git remote get-url origin &>/dev/null; then
    REMOTE_URL=$(git remote get-url origin)
    # Convert SSH to HTTPS if needed
    if [[ $REMOTE_URL == git@github.com:* ]]; then
        GITHUB_URL=$(echo "$REMOTE_URL" | sed 's/git@github.com:/https:\/\/github.com\//' | sed 's/\.git$//')
    else
        GITHUB_URL=$(echo "$REMOTE_URL" | sed 's/\.git$//')
    fi
    print_success "GitHub URL detected: $GITHUB_URL"
else
    print_info "No git remote detected. Please manually add the repo URL."
    GITHUB_URL="https://github.com/username/skill-name"
fi

# Generate the release post
echo ""
print_header "Skills Hub Release Post"
echo ""

# Title
cat << EOF
**Title:** [Skill Release] $SKILL_NAME – $DESCRIPTION_SHORT

---

**What it does:**

EOF

# Add features from SKILL.md or README
if [ -f "README.md" ]; then
    # Extract key features (lines starting with -)
    grep -E "^-.*:" README.md | head -3 | sed 's/^/  - /' || echo "  - $DESCRIPTION"
else
    echo "  - $DESCRIPTION"
fi

cat << EOF

**Why useful:**

EOF

# Extract use cases or add generic ones
if grep -q "Use cases" README.md 2>/dev/null; then
    # Extract content after "Use cases" until next heading
    sed -n '/## Use cases/,/^##/p' README.md | tail -n +2 | head -n -1 | grep "^-" | sed 's/^/  /' | head -3
elif grep -q "适合人群" README.md 2>/dev/null; then
    grep -A5 "适合人群" README.md | grep "^-" | sed 's/^/  /' | head -3
else
    cat << EOF
  - Helps developers work more efficiently with Claude Code
  - Saves time on repetitive tasks
  - Easy to integrate into existing workflows
EOF
fi

cat << EOF

**Example usage:**

EOF

# Add trigger phrases
if [ -n "$TRIGGER_PHRASES" ]; then
    echo "$TRIGGER_PHRASES" | tr ',' '\n' | while read -r phrase; do
        [ -n "$phrase" ] && echo "  - Say: \"$phrase\""
    done
else
    cat << EOF
  - Say: "Help me with [task]"
  - Say: "How do I [action]?"
  - Say: "Use $SKILL_NAME to [goal]"
EOF
fi

cat << EOF

**Repo:**
- $GITHUB_URL

**Tags:**
- claude-code, skill, $(echo "$SKILL_NAME" | sed 's/-/, /g')

---

EOF

print_header "Posting Instructions"
echo ""
echo "1. Copy the content above"
echo ""
echo "2. Choose a platform to post:"
echo "   - Discord: Join the Claude Code Discord and post in #new-skill-release"
echo "   - GitHub Discussions: Go to claudecodeplugins.io repo and start a discussion"
echo ""
echo "3. Customize the content before posting"
echo ""
echo "4. Engage with comments and feedback!"
echo ""
print_success "Release post generated successfully!"
echo ""
echo "💡 Tips for maximum impact:"
echo "   - Post when community is active (weekday mornings)"
echo "   - Include screenshots or GIFs if possible"
echo "   - Keep descriptions concise and specific"
echo "   - Respond to comments within 24 hours"
echo ""
