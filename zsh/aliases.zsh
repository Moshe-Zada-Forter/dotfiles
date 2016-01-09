# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YADR is installed.
yadr=$HOME/.yadr

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# YADR support
alias yav='yadr vim-add-plugin'
alias ydv='yadr vim-delete-plugin'
alias ylv='yadr vim-list-plugin'
alias yup='yadr update-plugins'
alias yip='yadr init-plugins'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
alias ae='vim $yadr/zsh/aliases.zsh; ar' #alias edit

TRAPHUP() {
  source $yadr/zsh/aliases.zsh
}

alias ar='source $yadr/zsh/aliases.zsh'  #alias reload
alias gar="killall -HUP -u \"$USER\" zsh"  #global alias reload

# vim using
mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim="mvim -v"
fi

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'

# Git Aliases
alias gs='git stash'
alias gsu='git submodule update'
alias g='git'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='ls'
alias tailf='tail -f'
alias lh='ls -alt | head' # see the last modified files
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

alias ka9='killall -9'
alias k9='kill -9'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# TODOS
# This uses NValt (NotationalVelocity alt fork) - http://brettterpstra.com/project/nvalt/
# to find the note called 'todo'
alias todo='open nvalt://find/todo'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Zeus
alias zs='zeus server'
alias zc='zeus console'
alias zr='zeus rspec'
alias zrc='zeus rails c'
alias zrs='zeus rails s'
alias zrdbm='zeus rake db:migrate'
alias zrdbtp='zeus rake db:test:prepare'

# Rspec
alias rs='rspec spec'
alias sr='spring rspec'
alias src='spring rails c'
alias srgm='spring rails g migration'
alias srdm='spring rake db:migrate'
alias srdt='spring rake db:migrate'
alias srdmt='spring rake db:migrate db:test:prepare'


# Sprintly - https://github.com/nextbigsoundinc/Sprintly-GitHub
alias sp='sprintly'
# spb = sprintly branch - create a branch automatically based on the bug you're working on
alias spb="git checkout -b \`sp | tail -2 | grep '#' | sed 's/^ //' | sed 's/[^A-Za-z0-9 ]//g' | sed 's/ /-/g' | cut -d"-" -f1,2,3,4,5\`"

alias hpr='hub pull-request'
alias grb='git recent-branches'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias dbtp='spring rake db:test:prepare'
alias dbm='spring rake db:migrate'
alias dbmr='spring rake db:migrate:redo'
alias dbmd='spring rake db:migrate:down'
alias dbmu='spring rake db:migrate:up'

alias brewu='brew update  && brew upgrade --all && brew cleanup && brew prune && brew doctor'

# Personal stuff
alias pull_request='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  https://github.com/$(git remote -v | sed -n "s/origin.*git\@github.com\:\(.*\/.*\).git.*(push)/\1/p")/compare/$(git symbolic-ref HEAD | awk -F "/" "{print \$3}")\?expand=1'

function ecc {
    eval `python ~/dev/snippets/ssh.py $*`
}

function squash {
  git fetch origin                && \
  git merge origin/develop        && \
  git reset --soft origin/develop && \
  git commit                      && \
  git push -f
}

function squashMaster {
  git fetch origin                && \
  git merge origin/master         && \
  git reset --soft origin/master  && \
  git commit                      && \
  git push -f
}


function notify_end () {
    $*
    terminal-notifier -message "$1 is endeed"
}

alias reload="killall -HUP zsh"
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias greo="grep"
alias rssh="ssh -l root"
alias sshr="ssh -l root"
alias gg="git grep"
alias clj="lein repl"
alias develop="git cd develop; git pull; gsu"
alias mergedevelop="git fetch && git merge origin/develop"
alias nosleep="sudo pmset -a sleep 0"
alias dosleep="sudo pmset -a sleep 10"
alias gc="git clone"
alias pyclean="find . -name \"*.py[co]\" -type f -delete"
alias nr="npm run"
alias a="atom"
alias startredis='sudo launchctl start io.redis.redis-server'
alias stopredis='sudo launchctl stop io.redis.redis-server'
alias curl="curl -s"
