# make backup of config files
if ! [ -d ~/.config/google-chrome/Default/extension_backup ]; then
	mkdir ~/.config/google-chrome/Default/extension_backup
else
	if ! [ -f ~/.config/google-chrome/Default/Preferences ]; then
		cp ~/.config/google-chrome/Default/Preferences ~/.config/google-chrome/Default/extension_backup/	
	fi
fi

#change config
sed -i -- 's/developer_mode":false/developer_mode":true/g' ~/.config/google-chrome/Default/Preferences

# TODO how to add new extension to chrome? research this!