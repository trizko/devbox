#terminal view changes
parse_git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[31m\]\$(parse_git_branch)\[\033[00m\]$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# ENV settings
export PATH="$PATH:/usr/local/bin/"

#general shortcuts
alias ls="ls --color=auto"
alias la="ls -la"
alias ll="ls -l"
alias lstree="find . -not -path '*/\.*'"

# dotfiles shortcuts
alias prof="vim ~/.bash_profile"
alias reprof=". ~/.bash_profile"
alias tconf="vim ~/.tmux.conf"

#file shortcuts
alias cdev="cd ~/dev"

#git shortcuts
alias ga="git add"
alias gb="git branch"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcm="git commit"
alias gcmm="git commit -m"
alias gcl="git clone"
alias gd="git diff"
alias gg="git grep"
alias gl="git log"
alias glo="git log --pretty=oneline"
alias glu="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias ghist="git log --pretty=format:'%Cblue%h%Creset %Cgreen%ad%Creset | %s%C(yellow)%d%Creset [%an]' --graph --date=short --decorate"
alias gr="git remote -v"
alias gra="git remote add"
alias grs="git reset --hard HEAD"
alias grv="git revert"
alias gm="git merge"
alias gp="git push"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpum="git pull upstream master"
alias gprum="git pull --rebase upstream master"
alias grb="git rebase"
alias gs="git status"

# Haskell / Stack / Cabal / Elm
export STACK_INSTALL_PATH="$HOME/.local/bin/"
export PATH="$PATH:$STACK_INSTALL_PATH"
export PATH="$HOME/.cabal/bin:$PATH"

# vim
alias vimrc="vim ~/.vimrc"

# nvm
source ~/.nvm/nvm.sh

### GO / GVM
export GOPATH="$HOME/dev/go"
export GOROOT="/usr/local/opt/go/libexec"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
alias gowork="cd $GOPATH"
alias gore="cd $GOPATH/src/github.com/trizko"

# custom
source $HOME/.custom_bash 2>/dev/null
