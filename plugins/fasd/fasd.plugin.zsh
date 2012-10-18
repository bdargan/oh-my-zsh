if [ $commands[fasd] ]; then # check if fasd is installed
  eval "$(fasd --init auto)"
  alias v='f -e vim'
  alias o='a -e open'
  alias j='fasd_cd -d'
  alias jj='fasd_cd -di'

  #undo alias 
  unalias z
  unalias zz

else 
  echo "fasd not installed"
fi

