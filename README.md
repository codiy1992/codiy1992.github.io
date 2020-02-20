# 我的博客

### jekyll环境项目搭建
1. 拷贝docker-compose.yml 及 Makefile 到仓库中
2. 执行`make bash`进入容器
3. 执行`jekyll new . --force`创建新的jekyll项目
4. 退出容器, 运行`make`命令, 然后浏览器访问`http://127.0.0.1:4000/`


### 配置theme
1. 根据`https://pmarsceill.github.io/just-the-docs/`文档配置theme


### 配置github-pages
1. 参考`https://help.github.com/en/github/working-with-github-pages/setting-up-a-github-pages-site-with-jekyll`


### 配置stackedit作为博文管理编辑器


### 配置disqus
1. 添加disqus,参考`https://desiredpersona.com/disqus-comments-jekyll/`