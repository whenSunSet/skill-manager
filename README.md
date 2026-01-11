# Skill Manager - Claude Code Skill

> **Claude Code Skill** | A comprehensive skill for managing the complete lifecycle of Claude Code skills—from creation and updates to publishing and community sharing.

管理 Claude Code Skills 完整生命周期的 Skill——从创建、更新到发布和社区分享！

## 关于 (About)

**Skill Manager** 是一个功能强大的 Claude Code Skill，为管理和创建 Claude Code Skills 提供完整的生命周期指导。

**解决的问题：**
- 不知道如何创建结构良好的 Skills
- 缺乏验证和测试 Skills 的标准流程
- 不清楚如何发布和分享 Skills 到社区
- 需要统一的 Skills 管理和更新流程

**适合人群：**
- 想创建新 Claude Code Skills 的用户
- 需要更新现有 Skills 的开发者
- 想将 Skills 发布到社区的贡献者
- 学习 Claude Code 插件生态的开发者

**关键特性：**
- ✅ 完整的技能创建指导
- ✅ 自动化安装和验证脚本
- ✅ 最佳实践和常见错误示例
- ✅ GitHub 发布和社区分享流程
- ✅ 渐进式文档结构（核心 + 详细参考资料）

## 🚀 快速开始

### 一键安装

```bash
cd skill-manager
./scripts/install.sh
```

安装脚本会：
- ✅ 创建 `~/.claude/skills/` 目录
- ✅ 复制 skill 到正确位置
- ✅ 验证安装成功
- ✅ 显示后续步骤

### 手动安装

```bash
# 创建 skills 目录
mkdir -p ~/.claude/skills

# 复制 skill
cp -r skill-manager ~/.claude/skills/

# 验证
ls -la ~/.claude/skills/skill-manager/
```

## 📖 使用方法

安装后，重启 Claude Code 或开始新对话，然后问：

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

这个 skill 会自动激活并提供详细指导！

## 📁 内容

```
skill-manager/
├── SKILL.md                    # 完整教程
├── references/
│   └── advanced-techniques.md  # 高级技巧
├── examples/
│   └── simple-skill.md         # 简单示例
├── scripts/
│   ├── install.sh              # 安装脚本 ✨
│   └── validate-skill.sh       # 验证脚本
└── README.md                   # 本文件
```

## 🔍 验证 Skill

运行验证脚本检查 skill 质量：

```bash
cd ~/.claude/skills/skill-manager/
./scripts/validate-skill.sh
```

## 🛠️ 脚本说明

### install.sh
自动安装这个 skill 到您的 Claude Code。

```bash
cd skill-manager
./scripts/install.sh
```

**特性：**
- 自动检测并创建 skills 目录
- 检测已安装的 skill
- 验证安装完整性
- 显示清晰的后续步骤

### validate-skill.sh
验证任何 skill 的结构和质量。

```bash
cd any-skill-directory/
/path/to/skill-manager/scripts/validate-skill.sh
```

**检查项：**
- ✅ SKILL.md 存在且格式正确
- ✅ YAML frontmatter 完整
- ✅ 描述使用第三人称
- ✅ 词数合理（1500-2000 字理想）
- ✅ 命令式语言（非第二人称）
- ✅ 引用的文件存在
- ✅ 脚本可执行

## 📚 学习路径

1. **阅读 SKILL.md** - 了解完整生命周期管理
2. **查看 examples/** - 学习简单示例
3. **阅读 advanced-techniques.md** - 掌握高级技巧
4. **创建你的 skill** - 使用 validate-skill.sh 验证
5. **安装并测试** - 使用 install.sh 安装
6. **发布到社区** - 分享你的 skill

## 🎯 这个 Skill 适合谁？

- ✅ 想创建新 Claude Code Skills 的用户
- ✅ 需要更新现有 Skills 的开发者
- ✅ 想将 Skills 发布到社区的贡献者
- ✅ 学习 Claude Code 插件生态的开发者
- ✅ 管理 Skills 完整生命周期的维护者

## 🔗 相关资源

- [Claude Code 文档](https://docs.claude.com)
- [Claude Agent SDK](https://github.com/anthropics/claude-agent-sdk)
- [MCP 协议](https://modelcontextprotocol.io)

## 🤝 贡献

欢迎改进这个 skill！

1. Fork 这个仓库
2. 创建你的分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 开启 Pull Request

## 📝 版本历史

- **1.0.0** (2025-01-11)
  - 初始版本
  - 完整的生命周期管理指南
  - 自动安装脚本
  - 验证工具
  - 社区发布流程

## ❓ 常见问题

### Q: Skill 没有激活？

**A:**
1. 检查安装位置：`ls -la ~/.claude/skills/skill-manager/`
2. 重启 Claude Code
3. 使用触发短语测试

### Q: 如何卸载？

**A:**
```bash
rm -rf ~/.claude/skills/skill-manager
```

### Q: 可以创建多个 skills 吗？

**A:** 可以！每个 skill 是独立的，放在 `~/.claude/skills/` 目录下。

### Q: 如何更新现有 skill？

**A:**
1. 进入 skill 目录或指定要更新的 skill
2. 使用 skill-manager 的更新流程
3. 验证更改后提交

### Q: 如何分享我的 skill？

**A:**
1. 创建 GitHub 仓库
2. 优化 README.md
3. 添加适当的 GitHub topics
4. 发布到 claude-plugins.dev（自动索引）
5. 在社区分享

### Q: 如何贡献改进？

**A:**
1. Fork skill-manager 仓库
2. 创建改进分支
3. 提交 Pull Request
4. 帮助社区改进技能管理

## 📄 许可证

MIT License - 随意使用和修改！

---

**Happy Skill Managing! 🎉**
