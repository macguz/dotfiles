export ZSH="~/.oh-my-zsh"

# eastwood  sunrise
ZSH_THEME="random"

# 插件
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

# 配置脚本
source $ZSH/oh-my-zsh.sh
# 自动启动clash，log路径=~/.clash_log
source ~/.local/config/clash_config/init.sh
# 初始化tmux
source ~/.local/config/tmux_config/init.sh
source ~/.local/config/z/z.sh

# alias
alias py='python'

# 环境变量
# 配置代理
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
# Golang环境变量
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.local/bin

