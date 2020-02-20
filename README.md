# 我的博客

### jekyll环境项目搭建
1. 拷贝docker-compose.yml 及 Makefile 到仓库中
2. 执行`make bash`进入容器
3. 执行`jekyll new . --force`创建新的jekyll项目
4. 退出容器, 运行`make`命令, 然后浏览器访问`http://127.0.0.1:4000/`


### 配置theme
1. 编辑_config.yml去掉默认的theme配置,并添加配置`remote_theme: pmarsceill/just-the-docs`
2. 如需自定义页面内容,可透过_layouts/default.html覆盖默认配置来实现


### 配置github-pages
1. 参考`https://help.github.com/en/github/working-with-github-pages/setting-up-a-github-pages-site-with-jekyll`


### 配置stackedit作为博文管理编辑器
1. 前往`https://stackedit.io/`添加一个workspaces,以项目的docs作为路径

### 配置gitalk
1. 配置_layouts/default.html, 以覆盖模板默认配置
2. 添加如下代码:
```
<!-- Link Gitalk  -->
    <link rel="stylesheet" href="https://unpkg.com/gitalk/dist/gitalk.css">
    <script src="https://unpkg.com/gitalk@latest/dist/gitalk.min.js"></script> 
    <div id="gitalk-container"></div>     <script type="text/javascript">
        var gitalk = new Gitalk({
            clientID:  '{{ site.gitalk.clientID }}',
            clientSecret: '{{ site.gitalk.clientSecret }}',
            repo: '{{ site.gitalk.repo }}',
            owner: '{{ site.gitalk.owner }}',
            admin: ['{{ site.gitalk.owner }}'],
            id: window.location.pathname,
            labels: ['gitalk'],
            perPage: 50
        });
        gitalk.render('gitalk-container');
    </script> 
<!-- Gitalk end -->
```
3. 编辑_config.yml增加gitalk配置
```
gitalk:
  owner: xxxx
  repo: xxxx
  clientID: xxxxxx
  clientSecret: xxxx
```