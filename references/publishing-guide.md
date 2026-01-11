# Complete Publishing Guide for Claude Code Skills

This guide provides comprehensive information about publishing your Claude Code skills to maximize discoverability and reach.

## Table of Contents

1. [Understanding Publishing Platforms](#understanding-publishing-platforms)
2. [Publishing to claudecodeplugins.io Skills Hub](#publishing-to-claudecodepluginsio-skills-hub)
3. [Publishing to claude-plugins.dev](#publishing-to-claude-pluginsdev)
4. [Pre-Publication Checklist](#pre-publication-checklist)
5. [Creating an Optimized README](#creating-an-optimized-readme)
6. [GitHub Repository Optimization](#github-repository-optimization)
7. [Publication Workflow](#publication-workflow)
8. [Post-Publication Strategy](#post-publication-strategy)
9. [Troubleshooting Discovery Issues](#troubleshooting-discovery-issues)
10. [Advanced Techniques](#advanced-techniques)

## Understanding Publishing Platforms

Claude Code skills can be published on multiple platforms, each with different advantages:

### Platform Comparison

| Platform | Type | Indexing | Engagement | Best For |
|----------|------|----------|------------|----------|
| **claudecodeplugins.io** | Community hub | Manual posting | High (direct) | Initial launch, feedback, community building |
| **claude-plugins.dev** | Directory | Automatic | Passive | Long-term discoverability, SEO |

### Recommended Strategy

**For maximum visibility, publish to both platforms:**

1. **Start with claudecodeplugins.io Skills Hub**
   - Post your release announcement
   - Get immediate feedback from community
   - Refine your skill based on responses

2. **Ensure visibility on claude-plugins.dev**
   - Set up GitHub repository properly
   - Add correct topics and optimize README
   - Let automatic indexing handle discovery

## Publishing to claudecodeplugins.io Skills Hub

**claudecodeplugins.io** (Skills Hub) is the community-driven platform where developers share and discover Claude Code skills through direct engagement.

### How It Works

Unlike automated directories, Skills Hub requires manual posting but offers:

- **Direct community engagement**: Get immediate feedback
- **Curated discovery**: Skills are reviewed by community members
- **Active discussion**: Q&A, feature requests, and improvements
- **Real feedback**: Learn what users actually want

### Where to Post

#### Option 1: Discord

1. **Join the Claude Code community Discord**
   - Find the invite link on claudecodeplugins.io
   - Join the server

2. **Locate the release channel**
   - Look for `#new-skill-release` or similar
   - Read channel rules and pinned messages

3. **Post your announcement**
   - Use the template below
   - Include all required information
   - Engage with responses

#### Option 2: GitHub Discussions

1. **Visit claudecodeplugins.io repository**
   - Go to: https://github.com/anthropics/claudecodeplugins.io
   - (or the appropriate community repo)

2. **Start a new discussion**
   - Click "Discussions" tab
   - Select "New Skill Release" category
   - Fill in the template

### Release Post Template

**Community preference**: Skills Hub favors **composable tool-type skills** over large, comprehensive agents. Keep your skill focused and specific.

```markdown
Title: [Skill Release] [Skill Name] – [One-line description]

What it does:
- [Brief explanation of core functionality]
- [Key feature 1 - specific]
- [Key feature 2 - specific]
- [What problem it solves]

Why useful:
- [Specific use case 1]
- [Specific use case 2]
- [Who benefits from this skill]
- [Why it's better than alternatives]

Example usage:
- "Say: [trigger phrase 1]"
- "Say: [trigger phrase 2]"
- "Say: [trigger phrase 3]"

Repo:
- https://github.com/username/skill-name

Tags:
- [relevant-tag-1], [relevant-tag-2], [relevant-tag-3]
```

### Complete Example

```markdown
Title: [Skill Release] API Request Builder – Construct HTTP requests with natural language

What it does:
- Generate curl commands and HTTP requests from natural language
- Support for all HTTP methods (GET, POST, PUT, DELETE, etc.)
- Automatic header and body formatting
- Works with any API endpoint

Why useful:
- Quickly test APIs without memorizing curl syntax
- Document API calls in plain English
- Share requests with team members easily
- Perfect for API exploration and debugging

Example usage:
- "Send a POST request to https://api.example.com/users with name: John"
- "Create a GET request with Authorization header"
- "Build a request to update user ID 123"

Repo:
- https://github.com/username/api-request-builder

Tags:
- api, http, curl, testing, debugging
```

### Best Practices

#### ✅ DO:

- **Focus on composable tools**: Small, focused skills that do one thing well
- **Be specific**: Clearly explain what the skill does in concrete terms
- **Show examples**: Provide actual trigger phrases users can say
- **Include repo link**: Always include the GitHub repository URL
- **Add relevant tags**: Help others discover your skill through categories
- **Respond to feedback**: Engage with comments within 24 hours
- **Be honest**: Transparent about limitations and edge cases
- **Show, don't tell**: Include screenshots, GIFs, or demo videos if possible

#### ❌ DON'T:

- **Post large agents**: Comprehensive agent systems are less favored
- **Be vague**: "A helpful skill" tells nothing
- **Skip the repo link**: Users need to see the code
- **Forget triggers**: How do users actually invoke the skill?
- **Ignore community**: Don't post and disappear
- **Over-hype**: Be realistic about capabilities
- **Spam**: One announcement is sufficient

### Using the Generator Script

skill-manager includes a script to generate your release post automatically:

```bash
# Navigate to skill-manager
cd ~/.claude/skills/skill-manager

# Run the generator
./scripts/generate-skills-hub-release.sh /path/to/your-skill

# Copy the output and post to Discord or GitHub Discussions
```

The script will:
- Extract skill name and description from SKILL.md
- Detect GitHub repository URL
- Generate properly formatted release post
- Provide posting instructions

### Tips for Maximum Impact

1. **Timing matters**
   - Post weekday mornings (US/EU timezone overlap)
   - Avoid weekends and holidays
   - Check when community is most active

2. **Visuals help**
   - Include screenshots of the skill in action
   - Create short demo GIFs (under 15 seconds)
   - Show before/after if applicable

3. **Keep it focused**
   - One clear use case
   - Specific problem solved
   - Concrete examples

4. **Engagement strategy**
   - Monitor replies for first 48 hours
   - Answer every question
   - Clarify misunderstandings
   - Thank early adopters

5. **Iterate and improve**
   - Update skill based on feedback
   - Post updates in the same thread
   - Document changes in README

### After Publishing

**First 24 hours:**
- Respond to all comments
- Clarify any confusion
- Fix critical bugs if found
- Thank early feedback

**First week:**
- Implement quick improvements
- Share usage statistics
- Highlight community contributions
- Consider writing a blog post

**Ongoing:**
- Monitor for issues in your GitHub repo
- Update skill with new features
- Share major updates back to Skills Hub
- Help other skill authors

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
