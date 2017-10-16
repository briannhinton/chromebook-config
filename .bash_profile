# Path configuration

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Prompt configuration

export CLICOLOR=1

parse_git_branch() {
  git branch 2> /dev/nul | grep "*" | sed -e 's/* \(.*\)/ {\1}/g'
  
export PS1="\${SELECT}\ `\[\e[32m\]\u@\h:\W\$(parse_git_branch) \$\[\e[0;39\]"  
