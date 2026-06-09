#!/bin/bash
# 把 .agents/skills 的 6 个棒同步安装到官方全局位置 ~/.claude/skills（真实文件）
# 改了源(.agents/AGENTS.md)后，跑一下：bash 同步skills到全局.sh
set -e
SRC="$(cd "$(dirname "$0")" && pwd)"
G="$HOME/.claude/skills"
mkdir -p "$G"
for d in lxc-1-jianchang lxc-2-jiedian-zhexian lxc-3-jiegou-shibie lxc-4-dingceng-tilian lxc-5-changtu-pinggu lxc-control; do
  rm -rf "$G/$d"
  cp -R "$SRC/.agents/skills/$d" "$G/$d"
  rm -rf "$G/$d/agents"   # 去掉 Codex 专属 yaml
done
cp "$SRC/AGENTS.md" "$G/lxc-1-jianchang/references/工作守则.md"
echo "✓ 已同步 6 个棒到 $G —— 重启 Claude Code 生效"
