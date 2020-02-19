---
layout: default
title: docker安装gitlab
parent: gitlab
nav_order: 2
---

1. 安装docker
    ```sudo yum install docker```

2. [安装docker-compose](https://docs.docker.com/compose/install/)

    ```shell
    sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose

    sudo chmod +x /usr/bin/docker-compose
    ```

3. 启动 `docker-compose up -d`

   其中 `docker-compose.yml` 如下文所示

    ```vim
    version: '2'
    services:
        gitlab:
          image: 'twang2218/gitlab-ce-zh:10.5.4'
          restart: unless-stopped
          hostname: 'git.wangle.ltd'
          environment:
            TZ: 'Asia/Shanghai'
            GITLAB_OMNIBUS_CONFIG: |
              external_url 'http://git.wangle.ltd'
              gitlab_rails['time_zone'] = 'Asia/Shanghai'
              gitlab_pages['enable'] = true
              gitlab_rails['pages_path'] = "/var/gitlab/pages"
              pages_external_url 'http://git.wangle.ltd'
              # 需要配置到 gitlab.rb 中的配置可以在这里配置，每个配置一行，注意缩进。
              # 比如下面的电子邮件的配置：
              gitlab_rails['smtp_enable'] = true
              gitlab_rails['smtp_address'] = "smtp.exmail.qq.com"
              gitlab_rails['smtp_port'] = 465
              gitlab_rails['smtp_user_name'] = "yy@xx.com"
              gitlab_rails['smtp_password'] = "xxxxx"
              gitlab_rails['smtp_authentication'] = "login"
              gitlab_rails['smtp_enable_starttls_auto'] = true
              gitlab_rails['smtp_tls'] = true
              gitlab_rails['gitlab_email_from'] = 'noreply@codiy.net'
              gitlab_rails['smtp_domain'] = "exmail.qq.com"
          ports:
            - '80:80'
            - '443:443'
            - '22:22'
          volumes:
            - /data/config:/etc/gitlab
            - /data/data:/var/opt/gitlab
            - /data/logs:/var/log/gitlab
            - /data/pages:/var/gitlab/pages

    ```
