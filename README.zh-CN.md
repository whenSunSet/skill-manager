# Skill Manager - Claude Code Skill

[English](README.md) | [中文版](README.zh-CN.md)

> **完整的 Claude Code Skills 生命周期管理工具包——从创建、更新到发布和社区分享！**

The complete toolkit for creating, publishing, and managing Claude Code Skills throughout their entire lifecycle.

---

**Claude Code Skill** | Model Context Protocol Compatible

这是一个全面的 Claude Code skill，为管理 Claude Code skills 的整个生命周期提供完整指导——从创建和更新到发布和社区分享。

## 功能介绍

Skill Manager 帮助你：

- **创建 Skills** - 使用最佳实践构建结构良好、高效的 Claude Code skills
- **验证 Skills** - 通过自动化验证确保你的 skills 符合质量标准
- **更新 Skills** - 通过适当的工作流程维护和改进现有 skills
- **发布 Skills** - 通过 GitHub 和 Skills Hub 与社区分享你的 skills
- **安装 Skills** - 用于 skill 部署的简便安装脚本

## 为什么有用

- **新手友好**：创建第一个 skill 的分步指导
- **最佳实践**：学习高效技能的成熟模式
- **自动化**：用于验证、安装和发布的脚本
- **社区导向**：直接指导发布到 Skills Hub 和 claude-plugins.dev
- **完整生命周期**：从创建到社区分享，一站式解决方案

## 安装

### 快速安装（推荐）

```bash
# 克隆或下载 skill-manager
cd skill-manager

# 运行安装脚本
./scripts/install.sh
```

安装脚本会：
- ✅ 创建 `~/.claude/skills/` 目录（如果需要）
- ✅ 复制 skill 到正确位置
- ✅ 验证安装成功
- ✅ 显示后续步骤

### 手动安装

```bash
# 创建 skills 目录
mkdir -p ~/.claude/skills

# 复制 skill-manager
cp -r skill-manager ~/.claude/skills/

# 验证安装
ls -la ~/.claude/skills/skill-manager/
```

## 使用方法

安装后，重启 Claude Code 或开始新会话，然后问：

**创建相关：**
- "如何创建一个 skill？"
- "帮我写一个新 skill"
- "skill 的结构是什么？"

**更新相关：**
- "如何更新这个 skill？"
- "修改 skill 内容"
- "改进现有 skill"

**发布相关：**
- "如何发布 skill 到社区？"
- "分享 skill 到 GitHub"
- "在 claude-plugins.dev 上发布"

skill-manager 会自动激活并提供详细指导！

## Skill 结构

```
skill-manager/
├── SKILL.md                          # 完整教程（24K+ 字）
├── README.md                         # 本文件（英文版）
├── README.zh-CN.md                   # 中文版
├── references/
│   └── advanced-techniques.md        # 高级创建方法
├── examples/
│   └── simple-skill.md               # 基础 skill 模板
├── scripts/
│   ├── install.sh                    # 自动安装脚本 ✨
│   ├── validate-skill.sh             # 验证脚本
│   ├── commit-skill-changes.sh       # 提交助手
│   └── generate-skills-hub-release.sh # 发布帖子生成器
└── .gitignore                        # Git 忽略模式
```

## 特性

### 完整生命周期管理

- **创建**：从目的定义到验证的分步指导
- **验证**：结构、质量和最佳实践的自动化检查
- **更新**：维护和改进 skills 的适当工作流程
- **发布**：GitHub、Skills Hub 和 claude-plugins.dev 的完整指南

### 最佳实践和模式

- 渐进式披露（元数据 → 核心 → 详细资源）
- 命令式/不定式写作风格
- 第三人称描述
- 精简的 SKILL.md（理想 1,500-2,000 字）
- references/ 中的详细内容

### 自动化脚本

- **install.sh**：一键安装到 Claude Code
- **validate-skill.sh**：全面的 skill 验证
- **commit-skill-changes.sh**：标准化提交消息
- **generate-skills-hub-release.sh**：社区发布帖子生成

### 社区发布

Skill Manager 为发布到以下平台提供完整指导：

1. **GitHub** - 公开仓库创建和优化
2. **claude-plugins.dev** - 自动索引平台
3. **Skills Hub** - 社区驱动分享（Discord 和 GitHub Discussions）

## Skill 创建工作流程

```bash
# 1. 创建 skill 结构
mkdir -p my-skill/{references,examples,scripts}

# 2. 编写带正确 frontmatter 的 SKILL.md
cd my-skill
vim SKILL.md  # 遵循 skill-manager 中的模板

# 3. 验证你的 skill
~/.claude/skills/skill-manager/scripts/validate-skill.sh

# 4. 测试安装
./scripts/install.sh

# 5. 发布到 GitHub
git init
git add .
git commit -m "Initial skill commit"
git push

# 6. 与社区分享
~/.claude/skills/skill-manager/scripts/generate-skills-hub-release.sh
```

## 验证

运行验证脚本检查任何 skill 的质量：

```bash
cd path/to/any-skill/
~/.claude/skills/skill-manager/scripts/validate-skill.sh
```

**检查项：**
- ✅ SKILL.md 存在且带有有效的 YAML frontmatter
- ✅ 第三人称描述
- ✅ 适当的字数（理想 1,500-2,000）
- ✅ 命令式/不定式形式（非第二人称）
- ✅ 引用的文件存在
- ✅ 脚本可执行
- ✅ 清晰的触发短语

## 发布到社区

Skill Manager 包含完整的发布指导：

### Skills Hub (claudecodeplugins.io)

为社区平台生成发布帖子：

```bash
~/.claude/skills/skill-manager/scripts/generate-skills-hub-release.sh /path/to/your-skill
```

发布到：
- Discord "New Skill Release" 频道
- GitHub Discussions (claudecodeplugins.io 仓库)

### claude-plugins.dev

通过 GitHub 自动索引：
1. 创建公开仓库
2. 优化 README.md
3. 添加 GitHub topics (claude, claude-code, skill, mcp)
4. 等待 24-48 小时索引

## 学习路径

1. **阅读 SKILL.md** - 了解完整生命周期管理
2. **查看 examples/** - 学习简单 skill 模板
3. **阅读 advanced-techniques.md** - 掌握高级方法
4. **创建你的 skill** - 使用 validate-skill.sh 进行质量检查
5. **安装并测试** - 使用 install.sh 部署
6. **发布到社区** - 与世界分享你的 skills

## 适合谁使用？

- ✅ 创建第一个 Claude Code skill 的用户
- ✅ 维护现有 skills 的开发者
- ✅ 向社区发布的贡献者
- ✅ 学习 Claude Code 插件生态的任何人
- ✅ 管理完整生命周期的 skill 维护者

## 脚本指南

### install.sh
自动将 skill-manager 安装到你的 Claude Code。

```bash
cd skill-manager
./scripts/install.sh
```

**特性：**
- 自动检测并创建 skills 目录
- 检测已安装的 skills
- 验证安装完整性
- 显示清晰的后续步骤

### validate-skill.sh
验证任何 skill 的结构和质量。

```bash
cd any-skill-directory/
~/.claude/skills/skill-manager/scripts/validate-skill.sh
```

**检查项：**
- ✅ SKILL.md 存在且格式正确
- ✅ YAML frontmatter 完整
- ✅ 第三人称描述
- ✅ 适当的字数
- ✅ 命令式语言（非第二人称）
- ✅ 引用的文件存在
- ✅ 脚本可执行

### commit-skill-changes.sh
使用标准化消息提交 skill 更改。

```bash
cd your-skill/
~/.claude/skills/skill-manager/scripts/commit-skill-changes.sh
```

### generate-skills-hub-release.sh
为 Skills Hub 生成发布帖子。

```bash
~/.claude/skills/skill-manager/scripts/generate-skills-hub-release.sh /path/to/your-skill
```

**输出：** 可直接发布的 Discord 和 GitHub Discussions markdown

## 系统要求

- 已安装 Claude Code
- Bash（用于脚本）
- Git（用于发布）

## 相关资源

- [Claude Code 文档](https://docs.claude.com)
- [Claude Agent SDK](https://github.com/anthropics/claude-agent-sdk)
- [MCP 协议](https://modelcontextprotocol.io)
- [claude-plugins.dev](https://claude-plugins.dev)
- [claudecodeplugins.io Skills Hub](https://claudecodeplugins.io)

## 贡献

欢迎贡献！skill-manager skill 本身就是一个全面的示例。

1. Fork 仓库
2. 创建你的分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 开启 Pull Request

## 常见问题

### 问：Skill 没有激活？

**答：**
1. 检查安装：`ls -la ~/.claude/skills/skill-manager/`
2. 重启 Claude Code
3. 使用触发短语测试

### 问：如何卸载？

**答：**
```bash
rm -rf ~/.claude/skills/skill-manager
```

### 问：可以创建多个 skills 吗？

**答：** 可以！每个 skill 是独立的，放在 `~/.claude/skills/` 目录下。

### 问：如何更新现有 skill？

**答：**
1. 进入 skill 目录或指定要更新的 skill
2. 使用 skill-manager 的更新工作流程
3. 验证后提交更改

### 问：如何分享我的 skill？

**答：**
1. 创建 GitHub 仓库
2. 优化 README.md
3. 添加适当的 GitHub topics
4. 发布到 claude-plugins.dev（自动索引）
5. 在社区分享（Skills Hub）

### 问：如何贡献改进？

**答：**
1. Fork skill-manager 仓库
2. 创建改进分支
3. 提交 Pull Request
4. 帮助改进社区工具包

## 许可证

MIT License - 自由使用和修改！

## 标签

`claude` `claude-code` `claude-skill` `skill` `skill-management` `publishing` `community` `mcp` `developer-tools`

---

**Made with Claude Code**

**祝 Skill 管理愉快！🎉**

[English Version](README.md)
