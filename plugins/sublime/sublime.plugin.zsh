# Sublime Text 2 Aliases

local _sublime_darwin_paths > /dev/null 2>&1
_sublime_darwin_paths=(
	"/usr/local/bin/subl"
	"$HOME/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
	"$HOME/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
	"/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
	"/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
)

if [[ $('uname') == 'Linux' ]]; then
	alias st='/usr/bin/sublime_text&'
elif  [[ $('uname') == 'Darwin' ]]; then
#	alias sl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
#	if [ -f '/usr/bin/sublime_text' ]; then
#		st_run() { nohup /usr/bin/sublime_text $@ > /dev/null & }
#	else
#		st_run() { nohup /usr/bin/sublime-text $@ > /dev/null & }
#	fi
#	alias st=st_run

	for _sublime_path in $_sublime_darwin_paths; do
		if [[ -a $_sublime_path ]]; then
			alias subl="'$_sublime_path'"
			alias st=subl
			break
		fi
	done
fi

alias stt='st .'

find_project()
{
    local PROJECT_ROOT="${PWD}"
    local FINAL_DEST="."

    while [[ $PROJECT_ROOT != "/" && ! -d "$PROJECT_ROOT/.git" ]]; do
        PROJECT_ROOT=$(dirname $PROJECT_ROOT)
    done

    if [[ $PROJECT_ROOT != "/" ]]; then
        local PROJECT_NAME="${PROJECT_ROOT##*/}"

        local SUBL_DIR=$PROJECT_ROOT
        while [[ $SUBL_DIR != "/" && ! -f "$SUBL_DIR/$PROJECT_NAME.sublime-project" ]]; do
            SUBL_DIR=$(dirname $SUBL_DIR)
        done

        if [[ $SUBL_DIR != "/" ]]; then
            FINAL_DEST="$SUBL_DIR/$PROJECT_NAME.sublime-project"
        else
            FINAL_DEST=$PROJECT_ROOT
        fi
    fi

    st $FINAL_DEST
}

alias stp=find_project
