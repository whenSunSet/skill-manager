---
name: skill-manager
description: This skill should be used when the user asks to "create a skill", "write a new skill", "build a custom skill", "make a Claude Code skill", "update a skill", "modify a skill", "edit existing skill", "publish a skill", "share a skill", "release to community", or asks about skill structure, skill development, skill updates, skill publishing, GitHub distribution, or how to make and share skills for Claude Code plugins. Provides complete guidance for creating, updating, publishing, and managing effective Claude Code skills throughout their entire lifecycle.
version: 1.0.0
---

# Skill Manager Guide

This skill provides comprehensive guidance for managing the complete lifecycle of Claude Code skills—from creation and updates to publishing and community sharing. Skills are modular, self-contained packages that extend Claude's capabilities with specialized knowledge, workflows, and tools.

## What is a Skill?

A skill transforms Claude from a general-purpose assistant into a specialized agent equipped with:
- **Domain expertise** - Specialized knowledge for specific fields
- **Workflows** - Multi-step procedures for common tasks
- **Tools** - Instructions for working with specific file formats or APIs
- **Resources** - Reusable scripts, references, and templates

## Skill Structure

Create this directory structure:

```
skill-name/
├── SKILL.md              # Required: Main skill definition
├── references/           # Optional: Detailed documentation
│   ├── patterns.md       # Detailed patterns and techniques
│   └── api-docs.md       # API references
├── examples/             # Optional: Working examples
│   └── example.py        # Complete, runnable code
└── scripts/              # Optional: Utility scripts
    └── validate.sh       # Executable tools
```

## Skill Lifecycle Management

Manage skills through their complete lifecycle: creation, testing, installation, updates, and publishing.

### Step 1: Define the Purpose

Identify concrete use cases:
- What problem does this skill solve?
- What will users say to trigger it?
- What resources are needed?

**Example questions:**
- "What functionality should the skill support?"
- "Can you give examples of how this skill would be used?"
- "What would a user say to trigger this skill?"

### Step 2: Create Directory Structure

```bash
mkdir -p skill-name/{references,examples,scripts}
cd skill-name
touch SKILL.md
```

### Step 3: Write SKILL.md

**Required Frontmatter:**

```yaml
---
name: skill-name
description: This skill should be used when the user asks to "phrase 1", "phrase 2", "another phrase", or discusses "topic area". Provides specific guidance for [domain].
version: 1.0.0
---
```

**Critical Description Rules:**
- ✅ Use third person: "This skill should be used when..."
- ✅ Include exact trigger phrases users would say
- ✅ Be specific about the domain
- ❌ Avoid: "Use this skill when..." (second person)
- ❌ Avoid: "Provides help..." (too vague)

**SKILL.md Body:**

Keep the body lean (1,500-2,000 words ideal). Include:
- Overview of what the skill does
- When to use it (already in description)
- Core procedures and workflows
- References to supporting files

Use **imperative/infinitive form** (verb-first):

✅ **Correct:**
```markdown
To create a file, use the Write tool.
Validate the input before processing.
Check the configuration.
```

❌ **Incorrect:**
```markdown
You should create a file using the Write tool.
You need to validate the input.
You must check the configuration.
```

### Step 4: Add Supporting Resources

**references/** - Detailed documentation
Load only when Claude needs them. Perfect for:
- API documentation
- Detailed patterns
- Advanced techniques
- Migration guides

**examples/** - Working examples
Complete, runnable code that users can copy:
- Sample scripts
- Template files
- Configuration examples

**scripts/** - Utility scripts
Executable code for common operations:
- Validation tools
- Testing helpers
- Automation scripts

Make scripts executable: `chmod +x scripts/script.sh`

### Step 5: Reference Resources in SKILL.md

Always tell Claude about additional resources:

```markdown
## Additional Resources

### Reference Files
For detailed information, consult:
- **`references/advanced-techniques.md`** - Advanced skill creation methods
- **`references/publishing-guide.md`** - Publishing skills to the community

### Examples
Working examples in `examples/`:
- **`simple-skill.md`** - Basic skill template
- **`README-template.md`** - Optimized README for discoverability

### Scripts
Utility scripts in `scripts/`:
- **`validate-skill.sh`** - Validate skill structure
- **`install.sh`** - Install skill to Claude Code
- **`commit-skill-changes.sh`** - Commit skill changes with proper messages
- **`upload-to-github.sh`** - Upload skill to GitHub
```

### Step 6: Validate the Skill

**Structure Check:**
- [ ] SKILL.md exists with valid YAML frontmatter
- [ ] Frontmatter has `name` and `description`
- [ ] Markdown body is present
- [ ] Referenced files exist

**Description Quality:**
- [ ] Uses third person ("This skill should be used when...")
- [ ] Includes specific trigger phrases
- [ ] Lists concrete scenarios
- [ ] Not vague

**Content Quality:**
- [ ] Uses imperative/infinitive form (not second person)
- [ ] SKILL.md is lean (1,500-2,000 words ideal)
- [ ] Detailed content in references/
- [ ] Examples are complete and working
- [ ] Scripts are executable

**Test the Skill:**
- [ ] Skill triggers on expected queries
- [ ] Content is helpful
- [ ] No duplicated information
- [ ] References load correctly

### Step 7: Iterate

After using the skill:
1. Note struggles or inefficiencies
2. Identify what should be updated
3. Make changes and test again

**Common improvements:**
- Strengthen trigger phrases in description
- Move long sections from SKILL.md to references/
- Add missing examples or scripts
- Clarify ambiguous instructions

## Quick Templates

### Minimal Skill

```
skill-name/
└── SKILL.md
```

Good for: Simple knowledge, no complex resources

### Standard Skill (Recommended)

```
skill-name/
├── SKILL.md
├── references/
│   └── detailed-guide.md
└── examples/
    └── working-example.py
```

Good for: Most skills with detailed documentation

### Complete Skill

```
skill-name/
├── SKILL.md
├── references/
│   ├── patterns.md
│   └── advanced.md
├── examples/
│   ├── example1.py
│   └── example2.json
└── scripts/
    └── validate.sh
```

Good for: Complex domains with utilities

## Best Practices

✅ **DO:**
- Use third-person in description
- Include specific trigger phrases
- Keep SKILL.md lean (1,500-2,000 words)
- Use progressive disclosure (details in references/)
- Write in imperative/infinitive form
- Reference supporting files clearly
- Provide working examples
- Create utility scripts for common tasks

❌ **DON'T:**
- Use second person anywhere
- Have vague trigger conditions
- Put everything in SKILL.md (>3,000 words)
- Leave resources unreferenced
- Include broken examples
- Skip validation

## Progressive Disclosure

Skills use a three-level loading system:

1. **Metadata** (name + description) - Always loaded (~100 words)
2. **SKILL.md body** - Loaded when skill triggers (<5,000 words)
3. **Bundled resources** - Loaded as needed (unlimited)

This keeps context efficient while providing comprehensive resources when needed.

## Common Mistakes

### Mistake 1: Weak Trigger Description

❌ **Bad:**
```yaml
description: Provides guidance for working with APIs.
```

✅ **Good:**
```yaml
description: This skill should be used when the user asks to "call the API", "make a request", "authenticate with API", or discusses API integration, endpoints, or HTTP methods.
```

### Mistake 2: Too Much in SKILL.md

❌ **Bad:**
```
SKILL.md (8,000 words - everything)
```

✅ **Good:**
```
SKILL.md (1,800 words - core)
references/advanced-techniques.md (2,500 words - details)
references/publishing-guide.md (3,700 words - publishing)
```

### Mistake 3: Second Person Writing

❌ **Bad:**
```markdown
You should start by reading the config.
You need to validate the input.
```

✅ **Good:**
```markdown
Start by reading the config.
Validate the input before processing.
```

### Mistake 4: Unreferenced Resources

❌ **Bad:**
```markdown
# Main content
[No mention of references/ or examples/]
```

✅ **Good:**
```markdown
# Main content

## Additional Resources
- `references/advanced-techniques.md` - Advanced methods
- `examples/simple-skill.md` - Working example
```

## Installation and Usage

### Quick Install for This Skill

To install this skill-creation skill in your Claude Code:

```bash
# 1. Find or create your local skills directory
mkdir -p ~/.claude/skills

# 2. Copy this skill to your local directory
cp -r /path/to/skill-creation ~/.claude/skills/

# 3. Verify installation
ls -la ~/.claude/skills/skill-creation/
```

### Installation Methods

#### Method 1: Local Skills Directory (Recommended for Personal Use)

Claude Code can load skills from a local directory:

```bash
# Create skills directory
mkdir -p ~/.claude/skills

# Copy your skill there
cp -r your-skill ~/.claude/skills/

# Skills are auto-discovered
```

**Verify installation:**
```bash
# Check skill structure
ls -la ~/.claude/skills/your-skill/

# Validate the skill
cd ~/.claude/skills/your-skill/
./scripts/validate-skill.sh  # if available
```

#### Method 2: Plugin (Recommended for Sharing)

Create a plugin to distribute skills:

```
my-plugin/
├── .claude-plugin/
│   └── plugin.json          # Plugin metadata
└── skills/
    └── my-skill/
        └── SKILL.md
```

**plugin.json example:**
```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "My custom skills",
  "author": "Your Name",
  "skills": ["skills/my-skill"]
}
```

Install the plugin:
```bash
# Copy to plugins directory
cp -r my-plugin ~/.claude/plugins/

# Or use Claude Code's plugin installer
cc plugin install ./my-plugin
```

#### Method 3: GitHub Repository (for Distribution)

1. Create a GitHub repository with your skill
2. Use Claude Code's plugin installation from URL

```bash
cc plugin install https://github.com/username/skill-repo
```

### Testing Your Installation

After installing, test the skill:

1. **Restart Claude Code** or start a new session
2. **Use trigger phrases** from the skill's description
3. **Verify the skill activates**

**Example test for this skill:**
- Ask: "How do I create a skill?"
- Ask: "Help me write a new skill"
- Ask: "What's the structure of a skill?"

If the skill loads correctly, you'll see relevant guidance.

### Troubleshooting Installation

**Skill not activating?**

1. Check the skill location:
```bash
# Verify skill exists
ls -la ~/.claude/skills/skill-name/SKILL.md
```

2. Validate the skill structure:
```bash
cd ~/.claude/skills/skill-name/
# Check for SKILL.md
# Validate YAML frontmatter
# Check description quality
```

3. Restart Claude Code to reload skills

4. Check Claude Code logs for skill loading errors

**Common issues:**
- Missing SKILL.md file
- Invalid YAML frontmatter
- Skill not in correct directory
- Claude Code hasn't been restarted

### Updating Skills

To update an installed skill:

```bash
# Navigate to skill directory
cd ~/.claude/skills/skill-name/

# Pull updates (if from git)
git pull

# Or copy new files
cp -r /path/to/updated-skill/* .

# Restart Claude Code
```

### Uninstalling Skills

To remove a skill:

```bash
# Remove the skill directory
rm -rf ~/.claude/skills/skill-name/

# Or if part of a plugin
cc plugin uninstall plugin-name
```

## Publishing and Distribution

### Publishing to claude-plugins.dev

**claude-plugins.dev** is the primary discovery platform for Claude Code plugins and skills. Follow these guidelines to maximize visibility.

#### Understanding claude-plugins.dev

**How it works:**
- Automatically indexes public GitHub repositories
- No manual submission required
- README quality determines discoverability
- Uses GitHub's API to find Claude-related content

**Key Principle:**
> The site essentially performs: GitHub → Auto Index → Display

No manual "submission" is required, but optimizing for discoverability is essential.

#### Publication Checklist

✅ **Essential Steps:**

1. **Create a public GitHub repository**
   ```bash
   git init
   git add SKILL.md
   git commit -m "Initial skill commit"
   gh repo create my-skill --public --source=.
   git push -u origin main
   ```

2. **Optimize your README.md**
   - Must include clear identification
   - Explain what the skill does
   - Provide installation instructions
   - Include usage examples

3. **Add GitHub topics/tags**
   - Go to repository Settings → Topics
   - Add relevant tags (see recommendations below)

#### README Optimization

**Title/Header:**
```markdown
# My Skill - Claude Code Skill

> A powerful skill for [specific purpose]
```

**Clear Identification:**
Add one of these badges or statements:

```markdown
---
**Claude Code Skill** | **Claude MCP compatible**
---

This is a Claude Code skill that extends Claude with [capability].
```

**Recommended README Structure:**
```markdown
# Skill Name

> Brief description of what this skill does

## About
- What problem does this skill solve?
- Who is this for?
- Key features

## Installation
\`\`\`bash
# Installation instructions
\`\`\`

## Usage
Examples of trigger phrases and use cases

## Requirements
Any dependencies or prerequisites

## Contributing
How others can contribute
```

#### GitHub Topics/Tags

**Add these topics to your repository** (Settings → Topics):

**Essential Tags:**
- `claude`
- `claude-code`
- `claude-skill`
- `skill`

**Recommended Tags:**
- `mcp` (Model Context Protocol)
- `ai-agent`
- `anthropic`
- `claude-ai`

**Domain-Specific Tags:**
- Add tags relevant to your skill's domain
- Examples: `visualization`, `database`, `api`, `testing`

#### Speed Up Discovery

While automatic indexing works, these steps accelerate the process:

1. **Star your own repository** - Increases initial visibility
2. **Share on social media** - Creates backlinks
3. **Add to lists** - Submit to relevant plugin lists
4. **Write a blog post** - Creates more discoverability signals

#### Verification

Check if your skill is indexed:

1. Visit [claude-plugins.dev](https://claude-plugins.dev)
2. Search for your skill name
3. Verify the information displays correctly

**If not showing up:**
- Ensure repository is public (not private)
- Check that SKILL.md is in the repository
- Verify README has "Claude Code Skill" identifier
- Wait 24-48 hours for indexing
- Check GitHub repository settings

#### Best Practices for Maximum Discoverability

✅ **DO:**
- Use clear, descriptive repository names
- Write comprehensive README with examples
- Add all recommended GitHub topics
- Include "Claude Code Skill" in README
- Provide installation instructions
- Add usage examples and screenshots
- Keep documentation up to date
- Respond to issues and PRs

❌ **DON'T:**
- Create private repositories (won't be indexed)
- Use vague repository names like "my-skill"
- Skip the README optimization
- Forget to add topics/tags
- Leave installation instructions unclear
- Ignore issues and questions

#### Alternative Distribution Methods

**Besides claude-plugins.dev:**

1. **Direct GitHub sharing**
   - Share repository link directly
   - Works well for targeted distribution

2. **Plugin marketplaces**
   - npm registry (for node-based plugins)
   - Other community registries

3. **Community channels**
   - Discord servers
   - Reddit communities
   - Twitter/X
   - Developer forums

#### Publishing Workflow

Complete this workflow when publishing:

```bash
# 1. Prepare your repository
cd /path/to/your-skill

# 2. Create README.md if it doesn't exist
# Follow the template above

# 3. Initialize git (if not already done)
git init
git add .
git commit -m "Initial commit: [skill-name] skill"

# 4. Create public repository on GitHub
gh repo create [skill-name]-skill --public --source=. --remote=origin

# 5. Push to GitHub
git push -u origin main

# 6. Add topics via GitHub web interface
# Go to: https://github.com/username/[skill-name]-skill/settings
# Add: claude, claude-code, skill, mcp, ai-agent

# 7. Verify on claude-plugins.dev after 24-48 hours
```

#### Monitoring Your Skill

After publishing:

- **Check analytics** - GitHub provides traffic insights
- **Watch for stars/forks** - Indicates community interest
- **Monitor issues** - User feedback and bug reports
- **Track discussions** - Community engagement
- **Update regularly** - Keep skill current and maintained

## Updating Skills

When users want to update an existing skill, follow this workflow:

### Identify the Update Request

Users might say:
- "I want to update a skill"
- "Update my skill"
- "Modify the skill"
- "Change skill content"

### Check Current Directory First

**Important**: Always check if the current directory contains a skill before listing all skills.

```bash
# Check if current directory is a skill
if [ -f "SKILL.md" ]; then
    echo "Current directory is a skill: $(pwd)"
    # Ask if user wants to update this skill
else
    # List all available skills
    ls -1 ~/.claude/skills/
fi
```

### Select Skill to Update

1. **If current directory is a skill**: Ask if they want to update the current skill or choose a different one
2. **If current directory is not a skill**: List all skills from `~/.claude/skills/` and ask them to choose

### Understand Update Requirements

Ask what changes they want to make. Examples:
- Add new examples
- Update documentation
- Fix bugs
- Add new features
- Improve descriptions

### Make the Changes

Read the relevant skill files, understand the current implementation, and make the requested changes following best practices.

### Validate Changes

Run the validation script:

```bash
cd ~/.claude/skills/[skill-name]/
./scripts/validate-skill.sh
```

If validation fails, fix the issues before proceeding.

### Show Changes Preview

Display what will be committed:

```bash
cd ~/.claude/skills/[skill-name]/
git status
git diff
```

### Commit Changes

Use the commit-skill-changes.sh script:

```bash
bash ~/.claude/skills/skill-creation/scripts/commit-skill-changes.sh
```

Or manually:

```bash
git add .
git commit -m "descriptive message"
```

### Update in Claude Code (For Current Directory Skills)

**If the skill being updated is in the current directory (not in ~/.claude/skills/)**:

After committing changes, ask if they want to update the skill in Claude Code:

```bash
# Check if skill is already installed in Claude Code
if [ -d "~/.claude/skills/$SKILL_NAME" ]; then
    echo "Skill is already installed in Claude Code"
    read -p "Update it in ~/.claude/skills/? (y/N): "
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # Copy updated files to Claude Code
        rsync -av --delete '$(pwd)/' ~/.claude/skills/$SKILL_NAME/
        echo "✓ Skill updated in Claude Code"
    fi
else
    # Skill not installed, ask if they want to install it
    echo "Skill is not installed in Claude Code yet"
    read -p "Install it to ~/.claude/skills/? (y/N): "
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        mkdir -p ~/.claude/skills
        cp -r $(pwd)/ ~/.claude/skills/$SKILL_NAME/
        echo "✓ Skill installed in Claude Code"
    fi
fi
```

This ensures that updates made in a development directory can be synchronized to Claude Code's skills directory.

### Push to GitHub (Optional)

Ask if the user wants to push to GitHub. If yes:

```bash
git push
```

## Additional Resources

### Reference Files
For advanced techniques and publishing guidance:
- **`references/publishing-guide.md`** - Complete guide to publishing skills on claude-plugins.dev
- **`references/advanced-techniques.md`** - Advanced skill creation methods

### Examples
Study these examples for templates and best practices:
- **`examples/README-template.md`** - Optimized README template for maximum discoverability
- **`examples/simple-skill.md`** - Basic skill template
- This skill (skill-manager) serves as a comprehensive example
