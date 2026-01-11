# Skill Manager - Claude Code Skill

[English](README.md) | [中文版](README.zh-CN.md)

> **The complete toolkit for creating, publishing, and managing Claude Code Skills throughout their entire lifecycle.**

完整的 Claude Code Skills 生命周期管理工具包——从创建、更新到发布和社区分享！

---

**Claude Code Skill** | Model Context Protocol Compatible

This is a comprehensive Claude Code skill that provides complete guidance for managing the entire lifecycle of Claude Code skills—from creation and updates to publishing and community sharing.

## What It Does

Skill Manager helps you:

- **Create Skills** - Build well-structured, effective Claude Code skills with best practices
- **Validate Skills** - Ensure your skills meet quality standards with automated validation
- **Update Skills** - Maintain and improve existing skills with proper workflows
- **Publish Skills** - Share your skills with the community via GitHub and Skills Hub
- **Install Skills** - Easy installation scripts for skill deployment

## Why Useful

- **Beginner-friendly**: Step-by-step guidance for creating your first skill
- **Best practices**: Learn proven patterns for effective skills
- **Automation**: Scripts for validation, installation, and publishing
- **Community-focused**: Direct guidance for publishing to Skills Hub and claude-plugins.dev
- **Complete lifecycle**: From creation to community sharing, all in one place

## Installation

### Quick Install (Recommended)

```bash
# Clone or download skill-manager
cd skill-manager

# Run the installation script
./scripts/install.sh
```

The installation script will:
- ✅ Create `~/.claude/skills/` directory if needed
- ✅ Copy skill to the correct location
- ✅ Verify installation success
- ✅ Display next steps

### Manual Install

```bash
# Create skills directory
mkdir -p ~/.claude/skills

# Copy skill-manager
cp -r skill-manager ~/.claude/skills/

# Verify installation
ls -la ~/.claude/skills/skill-manager/
```

## Usage

After installation, restart Claude Code or start a new session, then ask:

**For creating skills:**
- "How do I create a skill?"
- "Help me write a new skill"
- "What's the structure of a skill?"

**For updating skills:**
- "How do I update this skill?"
- "Modify skill content"
- "Improve existing skill"

**For publishing skills:**
- "How do I publish a skill to the community?"
- "Share skill to GitHub"
- "Publish on claude-plugins.dev"

The skill-manager will automatically activate and provide detailed guidance!

## Skill Structure

```
skill-manager/
├── SKILL.md                          # Complete tutorial (24K+ words)
├── README.md                         # This file (English)
├── README.zh-CN.md                   # Chinese version
├── references/
│   └── advanced-techniques.md        # Advanced creation methods
├── examples/
│   └── simple-skill.md               # Basic skill template
├── scripts/
│   ├── install.sh                    # Auto-install script ✨
│   ├── validate-skill.sh             # Validation script
│   ├── commit-skill-changes.sh       # Commit helper
│   └── generate-skills-hub-release.sh # Release post generator
└── .gitignore                        # Git ignore patterns
```

## Features

### Complete Lifecycle Management

- **Creation**: Step-by-step guidance from purpose definition to validation
- **Validation**: Automated checks for structure, quality, and best practices
- **Updates**: Proper workflows for maintaining and improving skills
- **Publishing**: Complete guide to GitHub, Skills Hub, and claude-plugins.dev

### Best Practices & Patterns

- Progressive disclosure (metadata → core → detailed resources)
- Imperative/infinitive writing style
- Third-person descriptions
- Lean SKILL.md (1,500-2,000 words ideal)
- Detailed content in references/

### Automation Scripts

- **install.sh**: One-click installation to Claude Code
- **validate-skill.sh**: Comprehensive skill validation
- **commit-skill-changes.sh**: Standardized commit messages
- **generate-skills-hub-release.sh**: Release post generation for community

### Community Publishing

Skill Manager provides complete guidance for publishing to:

1. **GitHub** - Public repository creation and optimization
2. **claude-plugins.dev** - Automated indexing platform
3. **Skills Hub** - Community-driven sharing (Discord & GitHub Discussions)

## Skill Creation Workflow

```bash
# 1. Create skill structure
mkdir -p my-skill/{references,examples,scripts}

# 2. Write SKILL.md with proper frontmatter
cd my-skill
vim SKILL.md  # Follow templates in skill-manager

# 3. Validate your skill
~/.claude/skills/skill-manager/scripts/validate-skill.sh

# 4. Test installation
./scripts/install.sh

# 5. Publish to GitHub
git init
git add .
git commit -m "Initial skill commit"
git push

# 6. Share with community
~/.claude/skills/skill-manager/scripts/generate-skills-hub-release.sh
```

## Validation

Run the validation script to check any skill's quality:

```bash
cd path/to/any-skill/
~/.claude/skills/skill-manager/scripts/validate-skill.sh
```

**Checks:**
- ✅ SKILL.md exists with valid YAML frontmatter
- ✅ Third-person description
- ✅ Appropriate word count (1,500-2,000 ideal)
- ✅ Imperative/infinitive form (not second person)
- ✅ Referenced files exist
- ✅ Scripts are executable
- ✅ Clear trigger phrases

## Publishing to Community

Skill Manager includes complete publishing guidance:

### Skills Hub (claudecodeplugins.io)

Generate release posts for community platforms:

```bash
~/.claude/skills/skill-manager/scripts/generate-skills-hub-release.sh /path/to/your-skill
```

Post to:
- Discord "New Skill Release" channel
- GitHub Discussions (claudecodeplugins.io repo)

### claude-plugins.dev

Automated indexing via GitHub:
1. Create public repository
2. Optimize README.md
3. Add GitHub topics (claude, claude-code, skill, mcp)
4. Wait 24-48 hours for indexing

## Learning Path

1. **Read SKILL.md** - Understand complete lifecycle management
2. **Review examples/** - Study simple skill templates
3. **Check advanced-techniques.md** - Master advanced methods
4. **Create your skill** - Use validate-skill.sh for quality checks
5. **Install and test** - Use install.sh for deployment
6. **Publish to community** - Share your skills with the world

## Who Is This For?

- ✅ Users creating their first Claude Code skill
- ✅ Developers maintaining existing skills
- ✅ Contributors publishing to the community
- ✅ Anyone learning the Claude Code plugin ecosystem
- ✅ Skill maintainers managing complete lifecycles

## Scripts Guide

### install.sh
Auto-install skill-manager to your Claude Code.

```bash
cd skill-manager
./scripts/install.sh
```

**Features:**
- Auto-detect and create skills directory
- Detect already-installed skills
- Verify installation integrity
- Display clear next steps

### validate-skill.sh
Validate any skill's structure and quality.

```bash
cd any-skill-directory/
~/.claude/skills/skill-manager/scripts/validate-skill.sh
```

**Checks:**
- ✅ SKILL.md exists and formatted correctly
- ✅ YAML frontmatter complete
- ✅ Third-person description
- ✅ Appropriate word count
- ✅ Imperative language (not second person)
- ✅ Referenced files exist
- ✅ Scripts executable

### commit-skill-changes.sh
Commit skill changes with standardized messages.

```bash
cd your-skill/
~/.claude/skills/skill-manager/scripts/commit-skill-changes.sh
```

### generate-skills-hub-release.sh
Generate release posts for Skills Hub.

```bash
~/.claude/skills/skill-manager/scripts/generate-skills-hub-release.sh /path/to/your-skill
```

**Output:** Ready-to-post markdown for Discord and GitHub Discussions

## Requirements

- Claude Code installed
- Bash (for scripts)
- Git (for publishing)

## Resources

- [Claude Code Documentation](https://docs.claude.com)
- [Claude Agent SDK](https://github.com/anthropics/claude-agent-sdk)
- [MCP Protocol](https://modelcontextprotocol.io)
- [claude-plugins.dev](https://claude-plugins.dev)
- [claudecodeplugins.io Skills Hub](https://claudecodeplugins.io)

## Contributing

Contributions welcome! This skill-manager skill itself serves as a comprehensive example.

1. Fork the repository
2. Create your branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## FAQ

### Q: Skill not activating?

**A:**
1. Check installation: `ls -la ~/.claude/skills/skill-manager/`
2. Restart Claude Code
3. Test with trigger phrases

### Q: How to uninstall?

**A:**
```bash
rm -rf ~/.claude/skills/skill-manager
```

### Q: Can I create multiple skills?

**A:** Yes! Each skill is independent, placed in `~/.claude/skills/` directory.

### Q: How to update existing skill?

**A:**
1. Navigate to skill directory or specify skill to update
2. Use skill-manager's update workflow
3. Commit changes after validation

### Q: How to share my skill?

**A:**
1. Create GitHub repository
2. Optimize README.md
3. Add appropriate GitHub topics
4. Publish to claude-plugins.dev (auto-indexed)
5. Share in community (Skills Hub)

### Q: How to contribute improvements?

**A:**
1. Fork skill-manager repository
2. Create improvement branch
3. Submit Pull Request
4. Help improve the community toolkit

## License

MIT License - Free to use and modify!

## Topics

`claude` `claude-code` `claude-skill` `skill` `skill-management` `publishing` `community` `mcp` `developer-tools`

---

**Made with Claude Code**

**Happy Skill Managing! 🎉**

[中文版 (Chinese Version)](README.zh-CN.md)
