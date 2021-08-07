#! /bin/zsh

set -e
set -x

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
cp -rf etc/* $ETC/
cp -rf bin/* $BIN/
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

# source init.sh
if [ -e ~/.zshrc ]; then
	echo '~/.zshrc already exists'
else
	touch ~/.zshrc
fi

# mac下sed -i要求必须备份，加''即可
sed -i '' "\:$ETC/init.sh:d" ~/.zshrc
echo ". $ETC/init.sh" >> ~/.zshrc
