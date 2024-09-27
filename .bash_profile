source ~/.bashrc
export PATH=/home/jordancotter/Android/Sdk/platform-tools:/home/jordancotter/.bun/bin:/home/jordancotter/.local/bin:/usr/local/bin/mycommands/:/home/jordancotter/.local/bin/lvim:/home/jordancotter/.nvm/versions/node/v16.19.1/bin:/home/jordancotter/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/jordancotter/.pulumi/bin:/home/jordancotter/Development/Nutiliti/nutiliti/apps/cli/bin:/home/jordancotter/.local/kitty.app/bin
export EDITOR=vim
export ANDROID_HOME=/home/jordancotter/Android/Sdk

nvm use 20

alias path='echo $PATH | tr ":" "\n"'
alias g='git'
alias k='tmux kill-session -t'
alias pm='git pull origin master'
alias chm='git checkout master && git pull origin master'
alias sb='source ~/.bash_profile'
alias vb='vim ~/.bash_profile' # vbp for 'vim bash profile'
alias t=tmuxinator
alias tn='tmuxinator nutiliti'
alias tn2='tmuxinator nutiliti2'
alias bcore='pnpm build --filter=@nutiliti/core'
alias brr='pnpm build --filter=@nutiliti/rent-roll'
alias push='git push origin $(git branch | grep \* | cut -d " " -f2)'
alias fpush='git push origin +$(git branch | grep \* | cut -d " " -f2)'
alias pull='git pull origin $(git branch | grep \* | cut -d " " -f2)'
alias discard='git checkout -- . && git checkout -- ..'
alias nu='node build/index.js'
alias rr='nu runRentRoll'
alias sa='nu scheduleActivations --org'
alias rra='nu rentRollAudit --file'
alias rbr='nu runRentRoll --buildium'
alias bc='pnpm build --scope=core'
alias bb='pnpm build --scope=buildium-sdk'
alias ds='pnpm data-script'
alias gits='git status'
alias gitc='git commit --no-verify -m'
alias gitd='git diff'
alias gitb='git branch'
alias gch='git checkout'
alias rfdbl='pnpm refreshdb --to="local"'
alias enable-prettier='mv ~/.vim/vim-prettier ~/.vim/pack/plugins/start/'
alias disable-prettier='mv ~/.vim/pack/plugins/start/vim-prettier ~/.vim/'
alias cont='git rebase --continue'
alias testone='./node_modules/.bin/vitest -t'
alias sm='sudo mongod --fork --logpath /var/log/mongod.log'
alias lg='lazygit'
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvim-cosmic="NVIM_APPNAME=CosmicNvim nvim"
alias nvim-kickstart="NVIM_APPNAME=KickstartNvim nvim"
alias nvim-lazy="NVIM_APPNAME=LazyNvim nvim"
alias gtn="cd ~/Development/Nutiliti/nutiliti"
alias gtafr="cd ~/Development/afr/coop-utility"
alias gtcli="cd ~/Development/Nutiliti/nutiliti/apps/cli"
alias gtrr="cd ~/Development/Nutiliti/nutiliti/packages/rent-roll"
alias bar="cd - && brr && cd - && rr"
alias up="useprod"
alias amo="nu addMoveOutForDroppedTenants --org"
npm_commands="./node_modules/.bin"
NODE_PATH="/usr/local/lib/node_modules"
cabal="~/.cabal/bin"
go="/usr/local/go/bin"
ansible="/Library/Frameworks/Python.framework/Versions/3.6/bin"
pip="/Users/user/Library/Caches/pip"
python="~/Library/Python/3.6/bin"
terraform="~/opt/terraform"
gem="~/.gem/ruby/2.0.0/bin"
links="/usr/local/bin/links"
my_commands="/usr/local/bin/my_commands"

# source /usr/local/share/chruby/chruby.sh
# source /usr/local/share/chruby/auto.sh

function nvims() {
  # default is nvchad
  items=("default" "AstroNvim" "CosmicNvim" "KickstartNvim" "LazyNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

function ff() {
  /home/jordancotter/Downloads/firefox-123.0b1/firefox/firefox &
}

function get() {
  branchName=$1
  git fetch origin $branchName && git checkout $branchName
}

function getRevisions() {
  az containerapp revision list --all --name ca-rrw0ca5af41 --resource-group rg-rrw-prod
}

function setRevision() {
  az containerapp revision activate -g rg-rrw-prod --revision $1
}

/usr/bin/setxkbmap -option "ctrl:nocaps" # map ctrl to capslock in manjaro

export PROMPT_DIRTRIM=2
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
export PS1='\n\[\033[01;34m\]\w\[\033[00m\]\033[0;32m$(__git_ps1 " (%s)")\033[0m\$ '




