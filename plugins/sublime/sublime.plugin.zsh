# Sublime Text 2 Aliases
#unamestr = 'uname'

if [[ $('uname') == 'Linux' ]]; then
	alias sl='/usr/bin/sublime_text&'
elif  [[ $('uname') == 'Darwin' ]]; then
	alias sl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
fi
alias sll='sl .'
