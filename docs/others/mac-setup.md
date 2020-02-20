---
layout: default 
title: Mac装机配置
parent: others
nav_order: 2
hash: 2020-02-20-mac-setup

---

## Mac 装机步骤

1. 安装homebrew([https://brew.sh/](https://brew.sh/))
2. 安装item2 `brew cask install item2`
3. 安装chrome `brew cask install google-chrome`
4. 安装输入法
5. 设置键盘映射, 改为自己习惯的.
6. 安装配置oh-my-zsh

	6.1 安装oh-my-zsh
	`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

	6.2 安装powerline字体
	```
	# clone
	git clone https://github.com/powerline/fonts.git --depth=1
	# install
	cd fonts
	./install.sh
	# clean-up a bit
	cd ..
	rm -rf fonts
	```

	6.3 设置item2配色方案和字体
	> Perferences—->Profiles—->Colors—->Color Presets 选择 Solarized Dark
	> Perferences—->Profiles—->Text-->Font 选择任意 Powerline 结尾的字体

	6.4 安装zsh插件
    > brew install autojump
    > 在.zshrc中指定插件 plugins=(git autojump)
    
	6.5 修改zsh主题
	```
	vi .zshrc  
	// 修改ZSH_THEME  
	ZSH_THEME="agnoster"
	```
	
	6.6 设置.zshrc 不显示电脑名(在.zshrc导出该函数即可)
	```
	prompt_context() {  
		if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then  
		prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"  
		fi  
	}
    ```
    
	6.7 配置自己的profile
	 >  .myzshrc

7.  配置.ssh
```
~/.ssh/id_rsa 
~/.ssh/id_rsa.pub 
~/.ssh/config
各类ssh的rsa密钥
```

8. 安装配置vim
```
# 安装macvim
brew cask install macvim
# 然后将原有配置文件直接拷到~目录即可
拷贝这三个文件 .vim .vimrc .gvimrc
```

9.  安装召唤师alfred `brew cask install alfred`

10.  安装其他软件 
```
	brew cask install shadowsocksx-ng
	brew cask install intellij-idea
	brew cask install sequel-pro
	brew cask install robo-3t
	brew cask install kindle
	brew cask install vivaldi
	brew install svn
	
	# 容器
	brew cask install docker
	brew cask install podman
	
	# 运维
	brew install aws-cdk
	
	# node
	brew install node
	brew install yarn

	# java
	brew tap AdoptOpenJDK/openjdk
	brew cask install adoptopenjdk8
	brew install maven
	brew install gradle
	
	# python
	
	...
```  

11. 代码
```
    # 工作代码
    mkdir ~/Works
	
	# 自己代码
	mkdir ~/Repos
	
```

12. 家目录下有用的配置文件
```
    .aws/
    .gvimrc
    .ssh/
    .vim/
    .vimrc
    .zshrc
    .zshrc.my
    .workspaces
```

13. vscode配置文件
```
	1. command + shift + p 输入 settings打开settings.json 拷贝出来
	2. command + p 输入 keybindings.json 拷贝出来
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMzIyMjQ5MzAyLC0xMzU2OTIzNjUyLC05NT
Y3MzgzODddfQ==
-->