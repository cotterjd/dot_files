alias vb='vim ~/.bash_profile'
alias sb='source ~/.bash_profile'
alias l='ls -aG'
alias mkdir='mkdir -p'
alias mux='tmuxinator'
alias path='echo $PATH | tr ":" "\n"'
alias g='git'
alias gits='git status'
alias gitch='git checkout'
alias gitd='git diff'
alias gitb='git branch'
alias k='tmux kill-session -t'
alias pm='git pull origin master'
alias chm='git checkout master && git pull origin master'
alias push='git push origin $(git branch | grep \* | cut -d " " -f2)'
alias pull='git pull origin $(git branch | grep \* | cut -d " " -f2)'
alias discard='git checkout -- . && git checkout -- ..'
alias sm='sudo mongod --fork --logpath /var/log/mongod.log' # start mongo
alias testone='./node_modules/.bin/vitest -t'

localbin="/usr/local/bin"
usrbin="/usr/bin"
bin="/bin"
usrsbin="/usr/sbin"
sbin="/sbin"
my_commands="/usr/local/bin/my_commands"
links="/usr/local/bin/links"
gem="~/.gem/ruby/2.0.0/bin"
terraform="~/opt/terraform"
python="~/Library/Python/3.6/bin"
pip="/Users/user/Library/Caches/pip"
ansible="/Library/Frameworks/Python.framework/Versions/3.6/bin"
go="/usr/local/go/bin"
cabal="~/.cabal/bin"
NODE_PATH="/usr/local/lib/node_modules"
npm_commands="./node_modules/.bin"

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

/usr/bin/setxkbmap -option "ctrl:nocaps" # map ctrl to capslock in manjaro

function get() {                                                                                                                                                                         
  branchName=$1                                                                                                                                                                          
  git fetch origin $branchName && git checkout $branchName                                                                                                                               
} 

export PATH=$localbin:$usrbin:$bin:$usrsbin:$sbin:$links:$my_commands:$gem:$terraform:$python:$pip:$ansible:$go:$cabal:$NODE_PATH:$npm_commands
export EDITOR=vim

export PROMPT_DIRTRIM=2
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
export PS1='\[\033[01;34m\]\w\[\033[00m\]\033[0;32m$(__git_ps1 " (%s)")\033[0m\$ '


