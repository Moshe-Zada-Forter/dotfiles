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

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias hpr='hub pull-request'
alias grb='git recent-branches'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias brewu='brew update  && brew upgrade --all && brew cleanup && brew prune && brew doctor'

# Personal stuff
alias pull_request='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
    https://github.com/$(git remote -v | sed -n "s/origin.*git\@github.com\:\(.*\/.*\).* (push)/\1/p" | sed "s/.git//")/compare/$(git symbolic-ref HEAD | awk -F "/" "{print \$3}")\?expand=1'

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
function hl() {
    pbpaste | highlight --syntax=$1 -O rtf --font-size 24 --font Inconsolata --style solarized-dark -W -J 50 -j 3| pbcopy
}

function ecrLogin() {
    $(aws ecr get-login --region us-east-1| sed "s/-e none//g")
}

function ct() {
    BRANCH=$(git rev-parse --abbrev-ref HEAD | sed -e "s/moshe-//" -e "s/-feature//" -e "s/-/ /g")
    git commit -am ${BRANCH}
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
alias vi=vim
# alias ipyspark="PYSPARK_DRIVER_PYTHON=ipython $SPARK_HOME/bin/pyspark --master local[*] --packages com.amazonaws:aws-java-sdk:1.11.318,org.apache.hadoop:hadoop-aws:2.7.3,org.elasticsearch:elasticsearch-spark-20_2.11:5.6.0"
alias ipyspark="PYSPARK_DRIVER_PYTHON=ipython $SPARK_HOME/bin/pyspark --master local[*] "
alias service="brew services"
alias lp='lpass show --all -G '
alias pbc="pbcopy"
alias pbw="pwd | pbcopy"
alias pbp="pbpaste"
alias pt="py.test"
alias nyan="py.test --tap-stream --flake | tap-nyan"
alias json="python -m json.tool"
alias sub="subliminal download -l he ."
alias gc_repo="git checkout develop && git pull &&  git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d"
alias ungron="gron --ungron"
alias cat="bat"
alias ncdu="ncdu --color dark -x"
alias ipython="screen -X title ipython; ipython; screen -X title zsh"
alias prettifyCliboard="pbpaste|python -m json.tool | pbcopy"
alias python="python3"
alias pip="pip3"
