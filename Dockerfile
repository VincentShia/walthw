# 极简 Dockerfile：把 Docker Hub 的 bitnami/kafka 镜像“搬运”到阿里云 ACR
# 用途：在 ACR 企业版【构建实例】上执行此构建（构建集群在阿里云内网，可访问 docker.io，
#       不受你本机网络封锁影响），产物推到你自己的【公开】仓库，
#       之后本机即可从 aliyuncs.com 域匿名拉取，绕过 docker.io 被墙的问题。
#
# 使用步骤见对话说明：
#   1) 在 GitHub 或 Codeup 建一个仓库，把本文件放进去（仓库设为公开即可）
#   2) ACR 企业版 → 镜像仓库 → 创建仓库（命名空间自定，仓库名 kafka）→ 代码源选 GitHub/Codeup → 关联该仓库 → 触发构建
#   3) 构建完成后把仓库设为【公开】
#   4) 本机：crictl pull registry.cn-hangzhou.aliyuncs.com/<命名空间>/kafka:<tag>
#
# 说明：bitnami/kafka 用 KAFKA_CFG_* 环境变量配置（与我给的 kafka-demo.yaml 约定一致）。
#       3.7.1 是示例版本号，构建时也可改用其它你需要的 tag（如 3.8.0）。
FROM docker.io/bitnami/kafka:3.7.1
