# 推荐阅读：[提高效率从编写 init.sh 开始](https://zhuanlan.zhihu.com/p/50080614)

+ Your dotfiles are how you personalize your system. These are mine.
+ 阅读韦神文章得到的灵感，也借鉴了[hanxi/dotfiles: bash + tmux + neovim (github.com)](https://github.com/hanxi/dotfiles)
+ ohmyzsh:[玩转WSL(5)之zsh常用配置和插件 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/242199299)

# 使用说明：	

```shell
# 提前安装配置oh my zsh、vim、tmux
cp -r .local ~/
ln -s -f ~/.local/etc/oh-my-tmux/.tmux.conf ~/.tmux.conf
cp ~/.local/etc/.tmux.conf.local ~/.tmux.conf.local
ln -s -f ~/.local/etc/.vimrc ~/.vimrc
```



# 配置介绍：

## [oh-my-tmux](https://github.com/gpakosz/.tmux):

提供易用的快捷键配置、美化的tmux powerline和插件支持。

### 使用说明：

​	简单把官方文档总结一下，介绍一下如何使用：

​	oh-my-tmux提供了两个文件，.tmux.conf与.tmux.conf.local。官方推荐只更改local文件，在这个文件上做个性化设置，所以conf文件使用软链接，local文件使用cp。在我的项目.local/config/tmux_config/下提供了local文件，可以直接复制我的，对tmux外观做了一些修改。如果想使用tpm插件，oh-my-tmux新版本已经提供了内置的tpm支持，可以阅读local文件自己修改。

### 下载：

```shell
  git clone git@github.com:gpakosz/.tmux.git ~/.local/etc/oh-my-tmux
```

### 配置：

+ .tmux.conf.local（**用来添加自定义的设置，会覆盖conf文件中的默认配置，所以不要修改conf文件**）：

    外观设置

    ```shell
    # 推荐用我配置好的，可以在此之上再做个性化配置
    cp ~/.local/etc/.tmux.conf.local ~/.tmux.conf.local
    `````

+ .tmux.conf（**不建议修改！！！**）：

    ```shell
    ln -s -f ~/.local/etc/oh-my-tmux/.tmux.conf ~/.tmux.conf
    ```
    
    .tmux.conf.local中个人的修改：
    
    ```shell
    # 分屏 pane
    bind - split-window -v
    bind | split-window -h
    # 使用鼠标
    set -g mouse on 
    ```
    
    

### 初始化(可选)：

​	在.zshrc中添加：

```shell
# 每次启动终端自动接入main会话
source ~/.local/bin/tmux/init.sh
```

---



### tmux的一些常用快捷键：

+ Ctrl a: prefix
+ prefix + |: 右侧新建pane
+ prefix + -: 上侧新建pane
+ prefix + C: 新建一个会话（弹窗输入会话名称）
+ prefix +c: 在当前会话新建窗口
+ prefix + S: 切换到上一个会话(session)
+ prefix + s: 弹窗列表，切换会话
+ prefix + w: 切换窗口(pane)
+ prefix + @: 将当前会话的pane独立为一个新的session并进入
+ prefix + +: 将当前pane最大化

---



## [z](https://github.com/rupa/z):

根据历史跳转记录，提供快速跳转

### 下载：

```shell
git clone git@github.com:rupa/z.git ~/.local/etc/z
```

### 配置：

​	在~/.zshrc中添加或在init.sh(待完成)

```shell
source ~/.local/config/z/z.sh
```

### 使用：

z \<keyword>，跳转到最常使用的包含关键字\<keyword>的目录

---

## vim：

1. 安装[vim-plug](https://github.com/junegunn/vim-plug)管理vim插件。

    ```shell
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

2. 替换本地配置文件：

    ```shell
    ln -s -f ~/.local/etc/.vimrc ~/.vimrc
    ```

    如果想针对本地的.vimrc做一些不同的修改，也可以直接cp，而不是软连接。

3. 命令模式下输入**PlugInstall**，vim-plug会自动下载插件

---



## zsh：

+ 强烈建议cp而不是软链接（因为不同系统很可能遇到坑，之后可能会把不同系统需要的特殊配置独立成一个文件）

```shell
 cp ~/.local/etc/.zshrc ~/.zshrc
```

---


## .ideavimrc:

​	JetBrains的IDE对vim的支持还是比较好的，有特地为vim中一些好用的插件专门做适配的插件（比如easymotion）

```shell
ln -s -f ~/.local/etc/.ideavimrc ~/.ideamvimrc
```



## iterm2（或其他终端）：
+ 修改主题配色方案：[mbadolato/iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)
+ 字体推荐：https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/LiberationMono.zip
+ 终端图标推荐：https://www.flaticon.com/free-icon/nerd_626580
---

## Windows terminal:
+ https://docs.microsoft.com/zh-cn/windows/terminal/customize-settings/profile-general
+ https://docs.microsoft.com/zh-cn/windows/terminal/customize-settings/profile-appearance
+ https://dev.to/thefern/windows-terminal-icons-package-3hid

