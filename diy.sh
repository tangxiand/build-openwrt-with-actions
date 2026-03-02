# 请在下方输入自定义命令(一般用来安装第三方插件)(可以留空)

# 编辑默认的lan口ip地址
#!/bin/bash
# diy-part2.sh - 补充iStore源配置
set -e

# 添加iStore官方源
if ! grep -q "istore" feeds.conf.default; then
    echo 'src-git istore https://github.com/linkease/istore.git;main' >> feeds.conf.default
    echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf.default
    echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >> feeds.conf.default
fi

# 更新并安装feeds
./scripts/feeds update -a
./scripts/feeds install -a

# 应用配置
make defconfig

# 打印确认信息
echo "✅ iStore源配置完成"
echo "✅ 已安装所有feeds包"
