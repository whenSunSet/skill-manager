# Advanced Skill Creation Techniques

This document covers advanced techniques for creating sophisticated Claude Code skills.

## Progressive Disclosure Mastery

### What to Load at Each Level

**Level 1: Metadata (Always Loaded)**
- Skill name and description only
- ~100 words
- Must clearly indicate when to trigger

**Level 2: SKILL.md (When Skill Triggers)**
- Core concepts and overview
- Essential procedures
- Quick reference tables
- Pointers to references
- Target: 1,500-2,000 words (max 5,000)

**Level 3: Bundled Resources (As Needed)**
- Detailed patterns (2,000-5,000+ words)
- API documentation
- Advanced techniques
- Migration guides
- Unlimited size (scripts can execute without loading)

### Organizing Content Effectively

**Keep in SKILL.md:**
- "What" - Overview and purpose
- "When" - Trigger conditions (in description)
- "How" - Essential procedures and workflows
- "Where" - Pointers to detailed resources

**Move to references/:**
- Comprehensive patterns
- Edge cases and troubleshooting
- Extensive examples
- Migration guides
- API references

## Advanced Trigger Patterns

### Multiple Trigger Types

```yaml
description: This skill should be used when the user asks to "create a webhook", "set up webhook listener", "configure webhooks", mentions webhook events (push, pull_request, release), or discusses HTTP callback handling, payload validation, or webhook security.
```

### Context-Aware Triggers

Include context clues:
- File extensions: "when working with .json files"
- Directories: "when operating in the src/ directory"
- Technologies: "when using React components"
- Languages: "when writing Python code"

## Reusable Skill Patterns

### Pattern 1: API Integration Skill

Structure for API-specific skills:

```
api-name-skill/
├── SKILL.md                    # Core API concepts
├── references/
│   ├── authentication.md       # Auth methods
│   ├── endpoints.md            # Endpoint catalog
│   └── errors.md               # Error handling
└── examples/
    ├── basic-request.py
    └── error-handling.py
```

SKILL.md should include:
- API overview
- Authentication basics
- Common operations (3-5 most used)
- Error handling fundamentals
- References to detailed endpoint docs

### Pattern 2: File Format Skill

For working with specific file formats:

```
format-name-skill/
├── SKILL.md                    # Format overview
├── references/
│   ├── schema.md               # Complete schema
│   ├── validation.md           # Validation rules
│   └── migration.md            # Version migration
├── examples/
│   ├── minimal.format
│   └── complete.format
└── scripts/
    ├── validate.sh
    └── convert.sh
```

### Pattern 3: Framework-Specific Skill

For frameworks and libraries:

```
framework-name-skill/
├── SKILL.md                    # Framework basics
├── references/
│   ├── components.md           # Component catalog
│   ├── patterns.md             # Common patterns
│   └── best-practices.md       # Best practices
├── examples/
│   ├── basic-component.py
│   └── advanced-pattern.py
└── assets/
    └── template-project/       # Starter template
```

## Advanced Script Integration

### When to Use Scripts

Include executable scripts when:
- Same code is rewritten repeatedly
- Deterministic reliability is required
- Complex validation is needed
- Performance matters (avoid re-parsing large data)

### Script Design Patterns

**Validation Scripts:**

```bash
#!/bin/bash
# scripts/validate-skill.sh

# Check SKILL.md structure
if [ ! -f "SKILL.md" ]; then
    echo "Error: SKILL.md not found"
    exit 1
fi

# Validate YAML frontmatter
if ! grep -q "^---" SKILL.md; then
    echo "Error: Invalid frontmatter"
    exit 1
fi

echo "✓ Skill structure valid"
```

**Generation Scripts:**

```python
#!/usr/bin/env python3
# scripts/generate-template.py

import sys
import json

def generate_template(config):
    """Generate a template from config"""
    template = f"""
# Generated from {config['source']}

{generate_content(config)}
    """
    return template

if __name__ == "__main__":
    config = json.loads(sys.stdin.read())
    print(generate_template(config))
```

### Script Documentation

Always include:
- Purpose in comments
- Usage examples
- Input/output specifications
- Error handling

## Managing Complexity

### When to Split Skills

Consider splitting when:
- Different trigger phrases apply
- Content exceeds 5,000 words even with references
- Distinct use cases emerge

**Example:**

Instead of one "database-skill":
- `postgres-skill` - PostgreSQL specifics
- `mysql-skill` - MySQL specifics
- `database-common-skill` - Shared concepts

### Skill Composition

Create skills that reference other skills:

```markdown
## Related Skills

For authentication, see `auth-skill`.
For deployment, see `deployment-skill`.
```

## Testing Skills Effectively

### Unit Testing Skills

Test each component:
1. **Metadata**: Does skill trigger on expected phrases?
2. **SKILL.md**: Is content clear and actionable?
3. **References**: Do references load correctly?
4. **Examples**: Do examples work?
5. **Scripts**: Do scripts execute successfully?

### Integration Testing

Test skill in real workflows:
1. Start a new Claude Code session
2. Ask trigger phrases
3. Verify skill loads
4. Follow the guidance
5. Check if additional resources load

### User Testing

Get feedback from users:
- Which phrases triggered the skill?
- Was the guidance helpful?
- What was missing or unclear?
- What should be improved?

## Performance Optimization

### Reduce Token Usage

**Techniques:**
- Keep SKILL.md lean
- Use grep patterns in references for large files
- Create scripts instead of inline code
- Use examples/ instead of explaining code

**Example with grep patterns:**

```markdown
## Authentication Methods

For authentication patterns, grep in `references/auth.md`:
- OAuth 2: grep "oauth" references/auth.md
- API Keys: grep "api-key" references/auth.md
- JWT: grep "jwt" references/auth.md
```

### Lazy Loading Strategies

Design for as-needed loading:
- Put detailed content in references/
- Create multiple specific references
- Use clear file naming
- Reference specifically in SKILL.md

## Advanced Reference Organization

### By Complexity

```
references/
├── basics.md          # Getting started
├── intermediate.md    # Common tasks
└── advanced.md        # Complex scenarios
```

### By Topic

```
references/
├── authentication.md  # Auth methods
├── endpoints.md       # API endpoints
└── errors.md          # Error handling
```

### By Task

```
references/
├── quick-start.md     # First steps
├── common-tasks.md    # Frequent operations
└── edge-cases.md      # Rare scenarios
```

## Error Handling in Skills

### Graceful Degradation

When resources are missing:

```markdown
## Additional Resources

### Optional References
If available, consult:
- **`references/advanced.md`** - Advanced techniques (optional)

### Fallback
If references are unavailable, follow the core procedures in SKILL.md.
```

### Validation Feedback

Include validation in SKILL.md:

```markdown
## Validation Checklist

Before proceeding, verify:
- [ ] Configuration file exists
- [ ] Required environment variables set
- [ ] Dependencies installed
```

## Documentation Standards

### Consistent Structure

Use consistent section ordering:
1. Overview
2. Prerequisites
3. Core Procedures
4. Common Tasks
5. Advanced Topics
6. Troubleshooting
7. Resources

### Code Examples

Always provide:
- Complete, runnable examples
- Input/output specifications
- Error handling
- Comments explaining key parts

### Diagrams and Visuals

When helpful, include:
- ASCII diagrams for flows
- Tables for comparisons
- Code blocks for examples
- Bullet points for lists

## Maintenance and Updates

### Version Management

Use semantic versioning in frontmatter:
- `1.0.0` - Initial stable release
- `1.1.0` - Added features (backward compatible)
- `2.0.0` - Breaking changes
- `1.0.1` - Bug fixes

### Changelog

Keep a changelog in references/:

```markdown
# Changelog

## [1.1.0] - 2025-01-15
### Added
- New authentication method
- Performance optimization script

## [1.0.0] - 2025-01-01
### Initial Release
- Core functionality
- Basic examples
```

### Deprecation

When removing features:
1. Update version (major bump)
2. Document deprecation in SKILL.md
3. Provide migration guide in references/
4. Keep old content for one version cycle

## Accessibility

### Clear Language

- Use simple, direct language
- Avoid jargon when possible
- Define technical terms
- Provide examples for abstract concepts

### Multiple Learning Styles

Support different learning preferences:
- Text explanations
- Code examples
- Diagrams
- Step-by-step procedures
- Reference tables

## Summary

Advanced skill creation requires:
- Deep understanding of progressive disclosure
- Careful content organization
- Smart use of scripts and references
- Effective trigger design
- Thorough testing
- Ongoing maintenance

Focus on creating skills that load efficiently, provide clear guidance, and scale with complexity.
