# VIMRC 
# Arg 1 is file location,
# Arg 2 is link location,
# Arg 3 is a descriptor
function link_file() {
	echo "Linking: $3"
	if [ -e $2 ];
	then 
		echo "$2 exists - Not linking"
	else
		ln $1 $2
		echo "Successfuly Linked $2"
	fi
}

link_file "vimrc" "$HOME/.config/nvim/init.vim" "Vim config"
link_file "leader.vimrc" "$HOME/.config/nvim/leader.vimrc" "Vim leader config"
link_file "coc-settings.json" "$HOME/.config/nvim/coc-settings.json" "Vim coc config"
link_file "gitconfig" "$HOME/.gitconfig" "Git config"
link_file "gitignore" "$HOME/.gitignore" "Git Ignore"
link_file "bashrc" "$HOME/.bashrc" "Bashrc"
link_file "jshintrc" "$HOME/.jshintrc" "JSHint"
link_file "xinitrc"  "$HOME/.xinitrc"  "Xinit"
link_file "Xdefaults" "$HOME/.Xdefaults" "Xdefaults"
