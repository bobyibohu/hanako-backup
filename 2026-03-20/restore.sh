#!/bin/bash
# Hanako 一键恢复脚本
# 运行方式: ./restore.sh

echo "🔄 正在恢复 Hanako..."

# 获取脚本所在目录（这里存放了备份文件）
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_FILE="$SCRIPT_DIR/hanako_full_backup_2026-03-20.tar.gz"

# 目标目录
TARGET_DIR="$HOME/Desktop/hanako"

if [ ! -f "$BACKUP_FILE" ]; then
    echo "❌ 备份文件不存在: $BACKUP_FILE"
    exit 1
fi

# 备份当前状态（如果有的话）
if [ -d "$TARGET_DIR" ]; then
    echo "📦 备份当前状态..."
    mv "$TARGET_DIR" "$TARGET_DIR.backup_$(date +%Y%m%d_%H%M%S)"
fi

# 创建目标目录
mkdir -p "$TARGET_DIR"

# 解压
echo "📂 解压中..."
tar -xzf "$BACKUP_FILE" -C "$TARGET_DIR"

echo "✅ 恢复完成！"
echo "📁 恢复位置: $TARGET_DIR"
echo ""
echo "💡 如果遇到问题，当前目录已备份为: $TARGET_DIR.backup_XXXXXX"
