#! /bin/zsh

# 执行出错时结束程序
set -e
# 执行shell脚本时，输出执行内容
set -x

# 创建文件夹, etc存放资源文件，bin存放脚本
ETC=~/.local/etc
BIN=~/.local/bin
mkdir -p $ETC
mkdir -p $BIN

# git clone respository
cd ~/.local/
if [ -d dotfiles ]; then
    cd dotfiles
    git pull
else
	git clone git@github.com:macguz/dotfiles.git
    cd dotfiles
fi
# /. 将目录下所有文件拷贝，包括隐藏文件
cp -rf etc/. $ETC/
cp -rf bin/. $BIN/
cp bootstrap.sh $BIN/

# vim
if [ -f ~/.vim/autoload/plug.vim ]; then
	echo ''
else
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if command -v nvim 2>/dev/null; then
    nvim +PlugInstall +qall
else
    vim_version=`vim --version | head -1`
    if [[ `echo $vim_version | awk -F '[ .]' '{print $5}'` -gt 7 ]]; then
		if [ -f ~/.vimrc ]; then
			echo "~/.vimrc already exists"
		else
			ln -s -f $ETC/.vimrc ~/.vimrc
		fi
        vim +PlugInstall +qall
    fi
fi
	
# tmux
if [ -d $ETC/oh-my-tmux ]; then
    cd  $ETC/oh-my-tmux
    git pull
else
    git clone git@github.com:gpakosz/.tmux.git $ETC/oh-my-tmux
fi

if [ -f ~/.tmux.conf.local ]; then
    echo ""
else 
    cp $ETC/.tmux.conf.local ~/.tmux.conf.local
fi

if [ -f ~/.tmux.conf ]; then
    echo ""
else 
    ln -s -f $ETC/oh-my-tmux/.tmux.conf ~/.tmux.conf
fi

# z
if [ -d $ETC/z ]; then
    cd $ETC/z
    git pull
else 
    git clone git@github.com:rupa/z.git $ETC/z
fi

if [ -z "$ZSH" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	mv ~/.zshrc ~/.zshrc.bak
	cp $ETC/.zshrc ~/.zshrc
	source ~/.zshrc
fi

# source init.sh
# if [ -e ~/.zshrc ]; then
#	echo '~/.zshrc already exists'
# else
#	touch ~/.zshrc
# fi

# mac下sed -i要求必须备份，加''即可
# sed -i '' "\:$ETC/init.sh:d" ~/.zshrc
# sed -i "\:$ETC/init.sh:d" ~/.zshrc # for linux
# echo ". $ETC/init.sh" >> ~/.zshrc
