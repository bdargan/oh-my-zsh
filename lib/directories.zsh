# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'

alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

#cd () {
#  if   [[ "x$*" == "x..." ]]; then
#    cd ../..
#  elif [[ "x$*" == "x...." ]]; then
#    cd ../../..
#  elif [[ "x$*" == "x....." ]]; then
#    cd ../../..
#  elif [[ "x$*" == "x......" ]]; then
#    cd ../../../..
#  else
#    builtin cd "$@"
#  fi
#}

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

# mkdir & cd to it
function mcd() { 
  mkdir -p "$1" && cd "$1"; 
}

alias lb='ls -fld ./**/*(d`stat +device .`OL[1,10])'

#function , not working
function chpwd; {
    DIRECTORY="$PWD"
    while true; do
        if [ -f './.env.rc' ]; then
            source './.env.rc'
            break
        fi
        if [ -f './env' ]; then
            source './env'
            break
        fi
        [ $PWD = '/' ] && break
        cd -q ..
    done
    cd -q "$DIRECTORY"
}
