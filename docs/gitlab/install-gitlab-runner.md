---
layout: default
title: gitlab-runner的安装配置
parent: gitlab
nav_order: 2
---

#### 安装gitlab-runner

1. [直接本机安装](https://docs.gitlab.com/runner/install/linux-repository.html)

    ```shell
    # For RHEL/CentOS/Fedora
    curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash

    # For RHEL/CentOS/Fedora
    sudo yum install gitlab-runner

    # for RPM based systems
    yum list gitlab-runner --showduplicates | sort -r
    sudo yum install gitlab-runner-10.0.0-1

    ```

2. [通过docker安装](https://docs.gitlab.com/ee/ci/docker/using_docker_images.html#define-image-and-services-from-gitlab-ciyml)

    ```
    sudo gitlab-runner register \
      --url "https://gitlab.example.com/" \
      --registration-token "PROJECT_REGISTRATION_TOKEN" \
      --description "docker-ruby-2.1" \
      --executor "docker" \
      --docker-image ruby:2.1 \
      --docker-postgres latest \
      --docker-mysql latest
    ```
#### 创建代码目录,并为项目配置部署密钥相关命令

```shell
# 添加docker用户组
sudo groupadd docker

# 将gitlab-runner用户添加到docker用户组里
sudo usermod -aG docker gitlab-runner

# 启动docker服务
sudo service docker start

# 创建代码目录
sudo mkdir -p /data/wwwroot

# 将代码目录指定给gitlab-runner用户
sudo chown -R gitlab-runner.gitlab-runner  /data/wwwroot

# 切换至gitlab-runner用户
su gitlab-runner

# 生成密钥, 并将公钥填至gitlab上的对应项目的部署密钥
ssh-keygen -t rsa
```
