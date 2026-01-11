#!/bin/bash

# GitHub Upload Script for Claude Code Skills
# Uploads a validated skill to GitHub repository

set -e

# Colors (consistent with existing scripts)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"
SKILL_NAME="$(basename "$SKILL_DIR")"

echo -e "${BLUE}🚀 GitHub Upload for Claude Code Skills${NC}"
echo ""
echo "Skill: $SKILL_NAME"
echo "Location: $SKILL_DIR"
echo ""

# Function: Check if git is installed
check_git() {
    echo "🔍 Checking git..."
    if ! command -v git &> /dev/null; then
        echo -e "${RED}✗ git not found${NC}"
        echo ""
        echo "Git is required to upload to GitHub."
        echo ""
        echo "Install instructions:"
        echo "  macOS:   brew install git"
        echo "  Linux:   sudo apt install git  # Ubuntu/Debian"
        echo "           sudo yum install git  # CentOS/RHEL"
        echo "  Windows: https://git-scm.com/download/win"
        echo ""
        exit 1
    fi
    echo -e "${GREEN}✓ git found${NC}"
}

# Function: Create .gitignore
create_gitignore() {
    echo ""
    echo "📁 Creating .gitignore..."

    cat > "$SKILL_DIR/.gitignore" << 'EOF'
# Claude Code specific
.claude/
*.claude

# macOS
.DS_Store
.AppleDouble
.LSOverride

# Thumbnails
._*

# Files that might appear in the root of a volume
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns
.com.apple.timemachine.donotpresent

# Editor directories and files
.vscode/
.idea/
*.swp
*.swo
*~
.project
.classpath
.settings/

# Temporary files
*.tmp
*.temp
*.log

# Build artifacts
dist/
build/
*.egg-info/
__pycache__/
*.py[cod]
*$py.class

# Node modules (if using Node.js for tooling)
node_modules/

# Environment files
.env
.env.local
.env.*.local

# Test coverage
coverage/
.nyc_output/

# Backup files
*.bak
*.backup
EOF

    echo -e "${GREEN}✓ .gitignore created${NC}"
}

# Function: Generate README.md from SKILL.md
generate_readme() {
    echo ""
    echo "📖 Generating README.md..."

    # Check if README.md already exists
    if [ -f "$SKILL_DIR/README.md" ]; then
        read -p "README.md already exists. Overwrite? (y/N): " -n 1 -r
        echo ""
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}⚠ Keeping existing README.md${NC}"
            return
        fi
    fi

    # Extract metadata from SKILL.md
    local skill_name=$(grep "^name:" "$SKILL_DIR/SKILL.md" | cut -d':' -f2- | xargs)
    local skill_desc=$(grep "^description:" "$SKILL_DIR/SKILL.md" | cut -d':' -f2- | xargs)
    local skill_version=$(grep "^version:" "$SKILL_DIR/SKILL.md" | cut -d':' -f2- | xargs)

    cat > "$SKILL_DIR/README.md" << EOF
# $skill_name

$skill_desc

## 🚀 Quick Start

### Installation

\`\`\`bash
# Clone this repository
git clone https://github.com/USERNAME/$SKILL_NAME.git

# Copy to your Claude skills directory
mkdir -p ~/.claude/skills
cp -r $SKILL_NAME ~/.claude/skills/

# Verify installation
ls -la ~/.claude/skills/$SKILL_NAME/
\`\`\`

### Usage

After installation, restart Claude Code and use trigger phrases from the skill description.

## 📁 Structure

\`\`\`
$SKILL_NAME/
├── SKILL.md              # Main skill definition
├── README.md             # This file
├── references/           # Optional: Detailed documentation
├── examples/             # Optional: Working examples
└── scripts/              # Optional: Utility scripts
    └── validate-skill.sh # Validation tool
\`\`\`

## 🔍 Validation

Validate the skill structure:

\`\`\`bash
cd ~/.claude/skills/$SKILL_NAME/
./scripts/validate-skill.sh
\`\`\`

## 📚 Documentation

See \`SKILL.md\` for complete skill documentation and usage instructions.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This skill is provided as-is for use with Claude Code.

## 🔗 Links

- [Claude Code Documentation](https://docs.claude.com)
- [SKILL.md](SKILL.md) - Full skill documentation

---

**Version:** $skill_version
**Generated:** $(date +%Y-%m-%d)
EOF

    echo -e "${GREEN}✓ README.md generated${NC}"
    echo -e "${YELLOW}⚠ Remember to update USERNAME in the clone URL${NC}"
}

# Function: Initialize git repository
initialize_git() {
    echo ""
    echo "🔧 Initializing Git repository..."

    # Check if already a git repo
    if [ -d "$SKILL_DIR/.git" ]; then
        echo -e "${YELLOW}⚠ Git repository already exists${NC}"
        read -p "Reinitialize? This will remove current git history. (y/N): " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm -rf "$SKILL_DIR/.git"
            git -C "$SKILL_DIR" init
            echo -e "${GREEN}✓ Git repository reinitialized${NC}"
        else
            echo -e "${YELLOW}⚠ Using existing repository${NC}"
        fi
    else
        git -C "$SKILL_DIR" init
        echo -e "${GREEN}✓ Git repository initialized${NC}"
    fi

    # Add all files
    git -C "$SKILL_DIR" add .

    # Create initial commit
    git -C "$SKILL_DIR" commit -m "Initial commit: $SKILL_NAME skill

- Add SKILL.md with skill definition
- Add documentation and examples
- Add validation scripts

🤖 Generated with skill-creation"

    echo -e "${GREEN}✓ Initial commit created${NC}"
}

# Function: Prompt user to create GitHub repository
prompt_create_repo() {
    echo ""
    echo "📝 Create a GitHub repository"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo -e "1. Visit: ${BLUE}https://github.com/new${NC}"
    echo -e "2. Repository name: ${YELLOW}$SKILL_NAME${NC}"
    echo "3. Description: (optional) Add a description for your skill"
    echo -e "4. ⚠️  ${YELLOW}Important${NC}: Do ${RED}NOT${NC} initialize with:"
    echo "     - README"
    echo "     - .gitignore"
    echo "     - license"
    echo "5. Click 'Create repository'"
    echo ""
    read -p "Press Enter when you've created the repository..."
    echo ""
}

# Function: Get repository URL from user
get_repo_url() {
    while true; do
        read -p "Enter your repository URL (e.g., https://github.com/username/repo.git): " REPO_URL

        # Validate URL format
        if [[ ! $REPO_URL =~ ^https://github\.com/[^/]+/[^/]+\.git$ ]]; then
            echo -e "${RED}✗ Invalid GitHub repository URL${NC}"
            echo "URL should be in format: https://github.com/username/repo.git"
            echo ""
            continue
        fi

        # Extract username and repo name for summary
        GITHUB_USERNAME=$(echo "$REPO_URL" | sed -E 's|https://github\.com/([^/]+)/.*\.git|\1|')
        REPO_NAME=$(echo "$REPO_URL" | sed -E 's|https://github\.com/[^/]+/([^/]+)\.git|\1|')

        echo -e "${GREEN}✓ Repository URL validated${NC}"
        echo ""
        echo "Repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
        read -p "Continue with this repository? (Y/n): " -n 1 -r
        echo ""
        if [[ ! $REPLY =~ ^[Nn]$ ]]; then
            break
        fi
    done
}

# Function: Push to GitHub
push_to_github() {
    echo ""
    echo "📤 Pushing to GitHub..."

    # Check if remote exists
    if git -C "$SKILL_DIR" remote get-url origin &> /dev/null; then
        echo -e "${YELLOW}⚠ Remote 'origin' already exists${NC}"
        read -p "Update remote URL? (Y/n): " -n 1 -r
        echo ""
        if [[ ! $REPLY =~ ^[Nn]$ ]]; then
            git -C "$SKILL_DIR" remote set-url origin "$REPO_URL"
        fi
    else
        git -C "$SKILL_DIR" remote add origin "$REPO_URL"
    fi

    # Set branch to main
    git -C "$SKILL_DIR" branch -M main

    # Push to GitHub
    if git -C "$SKILL_DIR" push -u origin main; then
        echo -e "${GREEN}✓ Pushed to GitHub successfully${NC}"
    else
        echo -e "${RED}✗ Push failed${NC}"
        echo ""
        echo "Possible reasons:"
        echo "  - Authentication required (configure SSH or credential helper)"
        echo "  - Network connection issues"
        echo "  - Repository doesn't exist or URL is incorrect"
        echo ""
        echo "Git repository is initialized locally. You can push manually:"
        echo "  cd $SKILL_DIR"
        echo "  git push -u origin main"
        exit 1
    fi
}

# Function: Display summary
display_summary() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${GREEN}✨ Upload Complete!${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "📍 Repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo ""
    echo "🚀 Next Steps:"
    echo "   1. Visit your repository and add a LICENSE file"
    echo "   2. Update README.md with the correct USERNAME in clone URL"
    echo "   3. Add topics/tags for better discoverability"
    echo "   4. Share the repository URL with others"
    echo ""
    echo "📦 Installation for others:"
    echo "   git clone https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
    echo "   mkdir -p ~/.claude/skills"
    echo "   cp -r $REPO_NAME ~/.claude/skills/"
    echo ""
    echo "📚 Documentation:"
    echo "   https://github.com/$GITHUB_USERNAME/$REPO_NAME/blob/main/SKILL.md"
    echo ""
}

# Main function
main() {
    # Step 1: Check git
    check_git

    # Step 2: Confirm action
    echo ""
    read -p "Continue uploading '$SKILL_NAME' to GitHub? (Y/n): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        echo "Upload cancelled."
        exit 0
    fi

    # Step 3: Create .gitignore
    create_gitignore

    # Step 4: Generate README.md
    generate_readme

    # Step 5: Initialize Git repository
    initialize_git

    # Step 6: Prompt user to create GitHub repository
    prompt_create_repo

    # Step 7: Get repository URL
    get_repo_url

    # Step 8: Push to GitHub
    push_to_github

    # Step 9: Display summary
    display_summary
}

# Run main
main "$@"
