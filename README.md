# 我的博客

### 搭建方法
1. 拷贝docker-compose.yml 及 Makefile 到仓库中
2. 执行`make bash`进入容器
3. 执行`jekyll new . --force`创建新的jekyll项目
4. 根据`https://pmarsceill.github.io/just-the-docs/`文档配置theme
5. 添加disqus,参考`https://desiredpersona.com/disqus-comments-jekyll/`
6. 本地开发撰写`make`,然后浏览器访问`http://127.0.0.1:4000/`
