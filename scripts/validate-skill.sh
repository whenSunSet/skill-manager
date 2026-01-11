#!/bin/bash

# Skill Validation Script
# Validates Claude Code skill structure and content

set -e

SKILL_DIR="$(pwd)"
ERRORS=0
WARNINGS=0

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🔍 Validating skill in: $SKILL_DIR"
echo ""

# Check 1: SKILL.md exists
echo "Checking SKILL.md..."
if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
    echo -e "${RED}✗ SKILL.md not found${NC}"
    ERRORS=$((ERRORS + 1))
else
    echo -e "${GREEN}✓ SKILL.md exists${NC}"
fi

# Check 2: Valid YAML frontmatter
echo ""
echo "Checking YAML frontmatter..."
if [ -f "$SKILL_DIR/SKILL.md" ]; then
    if grep -q "^---" "$SKILL_DIR/SKILL.md"; then
        echo -e "${GREEN}✓ Frontmatter delimiters found${NC}"

        # Check for required fields
        if grep -q "^name:" "$SKILL_DIR/SKILL.md"; then
            echo -e "${GREEN}✓ name field present${NC}"
        else
            echo -e "${RED}✗ name field missing${NC}"
            ERRORS=$((ERRORS + 1))
        fi

        if grep -q "^description:" "$SKILL_DIR/SKILL.md"; then
            echo -e "${GREEN}✓ description field present${NC}"
        else
            echo -e "${RED}✗ description field missing${NC}"
            ERRORS=$((ERRORS + 1))
        fi
    else
        echo -e "${RED}✗ Invalid frontmatter format${NC}"
        ERRORS=$((ERRORS + 1))
    fi
fi

# Check 3: SKILL.md word count
echo ""
echo "Checking SKILL.md length..."
if [ -f "$SKILL_DIR/SKILL.md" ]; then
    WORD_COUNT=$(wc -w < "$SKILL_DIR/SKILL.md" | tr -d ' ')
    echo "Word count: $WORD_COUNT"

    if [ "$WORD_COUNT" -lt 100 ]; then
        echo -e "${YELLOW}⚠ SKILL.md seems too short (recommended: 1500-2000 words)${NC}"
        WARNINGS=$((WARNINGS + 1))
    elif [ "$WORD_COUNT" -gt 5000 ]; then
        echo -e "${YELLOW}⚠ SKILL.md is too long (recommended: 1500-2000 words, max 5000)${NC}"
        echo -e "${YELLOW}  Consider moving detailed content to references/${NC}"
        WARNINGS=$((WARNINGS + 1))
    else
        echo -e "${GREEN}✓ SKILL.md length is appropriate${NC}"
    fi
fi

# Check 4: Description quality
echo ""
echo "Checking description quality..."
if [ -f "$SKILL_DIR/SKILL.md" ]; then
    if grep -q "This skill should be used when" "$SKILL_DIR/SKILL.md"; then
        echo -e "${GREEN}✓ Description uses third person${NC}"
    else
        echo -e "${RED}✗ Description doesn't use third person${NC}"
        echo -e "${YELLOW}  Should start with: 'This skill should be used when...'${NC}"
        ERRORS=$((ERRORS + 1))
    fi

    if grep -q '"[^"]*"' "$SKILL_DIR/SKILL.md"; then
        echo -e "${GREEN}✓ Description includes trigger phrases${NC}"
    else
        echo -e "${YELLOW}⚠ Description may lack specific trigger phrases${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
fi

# Check 5: Writing style
echo ""
echo "Checking writing style..."
if [ -f "$SKILL_DIR/SKILL.md" ]; then
    # Check for second person (should avoid)
    if grep -iE "you should|you need|you must|you can|you'll" "$SKILL_DIR/SKILL.md" > /dev/null; then
        echo -e "${YELLOW}⚠ Possible second-person language found${NC}"
        echo -e "${YELLOW}  Use imperative form instead (e.g., 'Create file' not 'You should create file')${NC}"
        WARNINGS=$((WARNINGS + 1))
    else
        echo -e "${GREEN}✓ No obvious second-person language${NC}"
    fi
fi

# Check 6: Referenced files exist
echo ""
echo "Checking referenced resources..."
if [ -f "$SKILL_DIR/SKILL.md" ]; then
    # Extract references to files
    grep -oE '\*\*`[^/]+/[^`]+`\*\*' "$SKILL_DIR/SKILL.md" | sed 's/\*\*`//g' | sed 's/`\*\*//g' | while read -r ref; do
        if [ -f "$SKILL_DIR/$ref" ] || [ -d "$SKILL_DIR/$ref" ]; then
            echo -e "${GREEN}✓ $ref exists${NC}"
        else
            echo -e "${RED}✗ $ref referenced but not found${NC}"
            ERRORS=$((ERRORS + 1))
        fi
    done
fi

# Check 7: Script executability
echo ""
echo "Checking script permissions..."
if [ -d "$SKILL_DIR/scripts" ]; then
    SCRIPT_COUNT=0
    EXEC_COUNT=0
    for script in "$SKILL_DIR/scripts"/*; do
        if [ -f "$script" ]; then
            SCRIPT_COUNT=$((SCRIPT_COUNT + 1))
            if [ -x "$script" ]; then
                echo -e "${GREEN}✓ $(basename "$script") is executable${NC}"
                EXEC_COUNT=$((EXEC_COUNT + 1))
            else
                echo -e "${YELLOW}⚠ $(basename "$script") is not executable${NC}"
                echo -e "${YELLOW}  Run: chmod +x $script${NC}"
                WARNINGS=$((WARNINGS + 1))
            fi
        fi
    done

    if [ "$SCRIPT_COUNT" -eq 0 ]; then
        echo -e "${GREEN}✓ No scripts (optional)${NC}"
    fi
else
    echo -e "${GREEN}✓ No scripts directory (optional)${NC}"
fi

# Summary
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Validation Summary"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ "$ERRORS" -eq 0 ] && [ "$WARNINGS" -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed!${NC}"
    echo ""
    echo "Your skill looks good to go!"
    echo ""
    read -p "🚀 Do you want to upload this skill to GitHub? (y/N): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        if [ -f "$SCRIPT_DIR/upload-to-github.sh" ]; then
            bash "$SCRIPT_DIR/upload-to-github.sh"
        else
            echo -e "${YELLOW}⚠ upload-to-github.sh not found${NC}"
            echo "Make sure the script exists in the scripts/ directory."
        fi
    fi
    exit 0
elif [ "$ERRORS" -eq 0 ]; then
    echo -e "${YELLOW}⚠ $WARNINGS warning(s) found${NC}"
    echo ""
    echo "Consider addressing the warnings above for best results."
    echo ""
    read -p "🚀 Do you want to upload this skill to GitHub? (y/N): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        if [ -f "$SCRIPT_DIR/upload-to-github.sh" ]; then
            bash "$SCRIPT_DIR/upload-to-github.sh"
        else
            echo -e "${YELLOW}⚠ upload-to-github.sh not found${NC}"
            echo "Make sure the script exists in the scripts/ directory."
        fi
    fi
    exit 0
else
    echo -e "${RED}✗ $ERRORS error(s), $WARNINGS warning(s) found${NC}"
    echo ""
    echo "Please fix the errors before using the skill."
    exit 1
fi
