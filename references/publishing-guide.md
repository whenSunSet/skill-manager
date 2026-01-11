# Complete Publishing Guide for Claude Code Skills

This guide provides comprehensive information about publishing your Claude Code skills to maximize discoverability and reach.

## Table of Contents

1. [Understanding claude-plugins.dev](#understanding-claude-pluginsdev)
2. [Pre-Publication Checklist](#pre-publication-checklist)
3. [Creating an Optimized README](#creating-an-optimized-readme)
4. [GitHub Repository Optimization](#github-repository-optimization)
5. [Publication Workflow](#publication-workflow)
6. [Post-Publication Strategy](#post-publication-strategy)
7. [Troubleshooting Discovery Issues](#troubleshooting-discovery-issues)
8. [Advanced Techniques](#advanced-techniques)

## Understanding claude-plugins.dev

### How the Platform Works

claude-plugins.dev operates as an automated discovery engine:

```
GitHub API → Repository Analysis → Auto Indexing → Public Display
```

**Key characteristics:**
- **No manual submission**: Completely automated
- **Continuous scanning**: Regularly checks for new repositories
- **Smart filtering**: Uses signals to identify Claude-related content
- **Quality ranking**: Better documentation = higher visibility

### What Gets Indexed

The platform looks for:
1. **Repository topics**: `claude`, `claude-code`, `skill`, `mcp`
2. **README content**: Mentions of "Claude Code", "Claude MCP"
3. **File structure**: Presence of `SKILL.md`, `plugin.json`
4. **Code patterns**: Claude-specific code signatures

### Ranking Factors

Your skill's visibility depends on:
- ✅ README quality and completeness
- ✅ Clear "Claude Code Skill" identification
- ✅ Number of relevant topics/tags
- ✅ Installation instructions clarity
- ✅ Repository activity (stars, forks, updates)
- ✅ Code documentation quality

## Pre-Publication Checklist

### Phase 1: Content Review

Before publishing, verify:

**Skill Files:**
- [ ] `SKILL.md` exists with valid YAML frontmatter
- [ ] Description uses third person and includes trigger phrases
- [ ] Content follows best practices (imperative form, lean content)
- [ ] All referenced files exist
- [ ] Examples are complete and working

**Documentation:**
- [ ] `README.md` is comprehensive
- [ ] Installation instructions are clear
- [ ] Usage examples are provided
- [ ] License is specified
- [ ] Contributing guidelines exist (optional but recommended)

### Phase 2: Repository Setup

**Repository Health:**
- [ ] Repository is public (not private)
- [ ] Descriptive repository name
- [ ] Repository description explains the skill
- [ ] `.gitignore` is configured
- [ ] License file is present

**GitHub Configuration:**
- [ ] Topics/tags are added
- [ ] Repository settings are optimized
- [ ] Webhooks are configured (if needed)
- [ ] Branch protection rules are set (for collaboration)

### Phase 3: Testing

**Pre-Publication Tests:**
- [ ] Skill works locally in `~/.claude/skills/`
- [ ] Installation instructions work
- [ ] All examples are tested
- [ ] No broken links in documentation
- [ ] Markdown renders correctly

## Creating an Optimized README

### Essential README Elements

#### 1. Clear Identification

**Top of README MUST include:**

```markdown
# Skill Name - Claude Code Skill

> A concise description of the skill's purpose

---

**Claude Code Skill** | **Claude MCP compatible**

```

**Why this matters:**
- Automated scanners look for these keywords
- Users immediately understand what this is
- Sets proper expectations

#### 2. Compelling Introduction

**First paragraph should answer:**
- What does this skill do?
- Who is it for?
- Why should they use it?

**Example:**
```markdown
## About

This skill enables Claude Code to visualize complex code structures
as Mermaid diagrams. Perfect for developers who need to understand
legacy code, document architectures, or explain systems to teams.

**Key benefits:**
- Automatic diagram generation from code
- Multiple diagram types (flowcharts, sequence diagrams, etc.)
- Zero configuration required
```

#### 3. Quick Start

**Installation should be prominent and simple:**

```markdown
## Quick Start

```bash
mkdir -p ~/.claude/skills
git clone https://github.com/username/skill-name.git ~/.claude/skills/skill-name
```

That's it! Restart Claude Code and start using the skill.
```

#### 4. Usage Examples

**Provide concrete examples:**

```markdown
## Usage

Say things like:

> "Can you visualize the architecture of this React app?"
> "Create a flowchart for this authentication logic"
> "Show me the class relationships in this code"
```

#### 5. Visual Content

**Include screenshots or demo GIFs:**

```markdown
## Demo

![Skill Demo](screenshot.png)

*Example: Claude Code visualizing a React component architecture*
```

### Advanced README Techniques

#### Badges and Shields

Add informative badges:

```markdown
![Claude Code](https://img.shields.io/badge/Claude_Code-Skill-blue)
![Version](https://img.shields.io/github/v/release/username/skill-name)
![License](https://img.shields.io/github/license/username/skill-name)
![Stars](https://img.shields.io/github/stars/username/skill-name)
```

#### Table of Contents

For longer READMEs:

```markdown
## Table of Contents

- [About](#about)
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Contributing](#contributing)
```

#### Code Highlighting

Use proper syntax highlighting:

```markdown
\```bash
# Shell commands
\```

\```javascript
// JavaScript code
\```

\```yaml
# YAML configuration
\```
```

## GitHub Repository Optimization

### Repository Name

**Choose a clear, descriptive name:**

✅ **Good examples:**
- `claude-code-visualizer`
- `claude-api-helper`
- `database-schema-skill`

❌ **Avoid:**
- `my-skill`
- `cool-tool`
- `project-v2`

### Repository Description

**Write a compelling 150-character description:**

✅ **Good:**
> "Generate Mermaid diagrams from code automatically. Visualize architecture, flow, and data structures with Claude Code."

❌ **Bad:**
> "A skill for claude code"

### GitHub Topics

**Essential topics (always include):**
```
claude
claude-code
claude-skill
skill
mcp
ai-agent
```

**Add domain-specific topics:**
```
visualization
diagrams
mermaid
architecture
```

### Repository Settings Optimization

**Configure these settings:**

1. **Features:**
   - ✅ Issues (for feedback)
   - ✅ Discussions (for Q&A)
   - ✅ Wiki (optional, for extended docs)
   - ✅ Projects (optional, for roadmap)

2. **Merge options:**
   - Allow merge commits
   - Enable squash merging
   - Disable rebase merging (keeps history clean)

3. **Branch protection:**
   - Require PR reviews
   - Require status checks
   - Limit who can push

## Publication Workflow

### Step-by-Step Process

#### 1. Prepare Your Skill

```bash
# Navigate to your skill directory
cd /path/to/your-skill

# Validate structure
ls -la
# Expected: SKILL.md, README.md, etc.

# Test locally
cp -r . ~/.claude/skills/your-skill/
# Test in Claude Code
```

#### 2. Create README.md

```bash
# Use the template
cp ../skill-creation/examples/README-template.md README.md

# Customize it
vim README.md
```

#### 3. Initialize Git

```bash
# Initialize if not already done
git init

# Create .gitignore
cat > .gitignore << EOF
# Claude Code
.claude/

# OS files
.DS_Store
Thumbs.db

# Editor files
.vscode/
.idea/
*.swp
*.swo

# Temporary files
*.tmp
*.bak
EOF

# Add files
git add .
git commit -m "Initial commit: [Skill Name] skill for Claude Code"
```

#### 4. Create GitHub Repository

**Using GitHub CLI:**
```bash
# Create public repository
gh repo create your-skill-name --public --source=. --remote=origin --push

# Or manually: create on GitHub web, then:
git remote add origin https://github.com/username/your-skill-name.git
git push -u origin main
```

#### 5. Add Topics

1. Go to repository page on GitHub
2. Click ⚙️ Settings
3. Scroll to "Topics" section
4. Add topics:
   - `claude`
   - `claude-code`
   - `claude-skill`
   - `skill`
   - `mcp`
   - `ai-agent`
   - [your domain-specific topics]

#### 6. Verify README

**Checklist:**
- [ ] "Claude Code Skill" appears in first 3 lines
- [ ] Installation instructions are clear
- [ ] Usage examples are provided
- [ ] Badge/image links work
- [ ] All markdown renders correctly

#### 7. Initial Promotion

```bash
# Star your own repo (helps discovery)
gh repo view --web
# Click the ⭐ star button

# Share on social media
# Twitter/X: "Just published [skill name] for Claude Code! 🚀
# Check it out: https://github.com/username/repo-name #ClaudeCode #AI"
```

#### 8. Monitor Indexing

```bash
# Wait 24-48 hours, then check:
# 1. Visit claude-plugins.dev
# 2. Search for your skill name
# 3. Verify information is correct
```

## Post-Publication Strategy

### First Week Actions

**Day 1-3: Initial Push**
- Share on Twitter/X, LinkedIn, Reddit
- Post in relevant Discord communities
- Announce in Claude Code forums

**Day 4-7: Engagement**
- Respond to all issues and PRs
- Ask for feedback from early users
- Make quick improvements based on feedback

### Ongoing Maintenance

**Weekly:**
- Check for new issues
- Review and merge PRs
- Update documentation if needed

**Monthly:**
- Review analytics
- Update dependencies
- Add requested features
- Improve README based on common questions

**Quarterly:**
- Major version updates
- Feature additions
- Documentation overhaul
- Community highlights

### Building Community

**Encourage contributions:**
1. Add `CONTRIBUTING.md` with guidelines
2. Label issues as "good first issue"
3. Thank contributors in releases
4. Feature community use cases

**Engage with users:**
- Respond promptly to issues
- Ask for clarification on bug reports
- Solicit feature requests
- Share user success stories

## Troubleshooting Discovery Issues

### Not Appearing on claude-plugins.dev

**Check these items:**

1. **Repository Privacy**
   ```bash
   # Verify repository is public
   gh repo view --json visibility
   # Should show: "visibility": "public"
   ```

2. **README Content**
   - Search for "Claude Code Skill" in README
   - Verify it's in the first 100 lines
   - Check spelling: "Claude" not "Cloud"

3. **Topics Added**
   - Go to Settings → Topics
   - Verify at least `claude` and `claude-code` are present

4. **Wait Time**
   - Initial indexing: 24-48 hours
   - Updates: 1-7 days
   - If still missing after 7 days, check other items

### Low Visibility

**Improve discoverability:**

1. **Enhance README**
   - Add more examples
   - Include screenshots
   - Improve description clarity

2. **Get Stars**
   - Share on social media
   - Ask colleagues to star
   - Add to lists/roundups

3. **Increase Activity**
   - Make regular updates
   - Engage with issues
   - Release new versions

4. **Cross-Promote**
   - Mention in related repositories
   - Guest blog posts
   - Conference talks (if applicable)

## Advanced Techniques

### SEO for GitHub

**Optimize for search:**

1. **Keywords in description**
   ```
   "Claude Code skill for [domain] that [action]
   with [technology]. Generate [output] from [input]."
   ```

2. **Keywords in README**
   - Include in headings
   - Use in code examples
   - Mention in features list

3. **Backlinks**
   - Link from your personal blog
   - Mention in other repositories
   - Submit to directories

### Analytics and Monitoring

**Track your skill's performance:**

1. **GitHub Analytics**
   ```bash
   # View traffic
   gh repo view --web
   # Click Insights → Traffic
   ```

2. **Watch for forks/stars**
   ```bash
   # List stargazers
   gh api repos/username/repo/stargazers
   ```

3. **Monitor mentions**
   - Set up Google Alerts for repo name
   - Track Twitter/X mentions
   - Check Reddit for links

### A/B Testing

**Test different approaches:**

1. **README variations**
   - Try different headlines
   - Test installation methods
   - Compare example styles

2. **Topic combinations**
   - Use GitHub Insights to see which topics drive traffic
   - Experiment with different topic sets

3. **Description versions**
   - Update description monthly
   - Track click-through rates

### Monetization (Optional)

**If you want to offer commercial version:**

1. **Dual licensing**
   - Free: Community license (MIT/Apache)
   - Paid: Commercial license with support

2. **Sponsorship**
   - GitHub Sponsors button
   - Open Collective
   - Patreon

3. **Premium features**
   - Core skill: Free (MIT)
   - Enterprise features: Paid
   - Priority support: Paid tier

## Resources

- [claude-plugins.dev](https://claude-plugins.dev)
- [GitHub Topics Best Practices](https://docs.github.com/en/free-pro-team@latest/github/administering-a-repository/classifying-your-repository-with-topics)
- [Open Source Guides](https://opensource.guide/)

## Conclusion

Publishing a skill is just the beginning. The most successful skills:

1. Start with excellent documentation
2. Respond to community feedback
3. Iterate based on real usage
4. Maintain regular updates
5. Build a welcoming community

Remember: claude-plugins.dev's automated indexing means your README quality directly determines your skill's success. Invest time in creating clear, comprehensive documentation.
