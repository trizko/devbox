################################
# bash settings
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"
export HISTCONTROL=ignoreboth:erasedups

# view changes
active_prompt(){
    local reset=$(tput sgr0)
    local red=$(tput setaf 1)
    local green=$(tput setaf 2)
    local yellow=$(tput setaf 3)
    local blue=$(tput setaf 4)
    local purple=$(tput setaf 5)
    local cyan=$(tput setaf 6)
    local white=$(tput setaf 7)
    local bold=$(tput bold)
    local underlined=$(tput smul)
    local git_branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
    printf '\001%s\002%s\001%s\002%s\001%s\002%s\001%s\002%s\n\001%s\002$>\001%s\002 ' \
			"$cyan" "$USER" "$yellow" "@" "$cyan" "$PWD" "$yellow" "$git_branch" "$green" "$reset"
}
export PS1='$(active_prompt)'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# ENV settings
export PATH="$PATH:/usr/local/bin/"
export PATH="$PATH:$HOME/bin/"

#general shortcuts
alias la="ls -la"
alias ll="ls -l"
alias lstree="find . -not -path '*/\.*'"

# dotfiles shortcuts
alias vim="nvim"
alias prof="nvim ~/.bash_profile"
alias reprof=". ~/.bash_profile"
alias tconf="nvim ~/.tmux.conf"
alias vimrc="nvim ~/.config/nvim/init.vim"

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

# git go forward/back in commit
alias gback="git checkout HEAD~"
gfwd() {
    git checkout $(git rev-list --topo-order HEAD.."$*" | tail -1)
}

