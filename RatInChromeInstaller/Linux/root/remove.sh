if [ -f /opt/google/chrome/google-chrome ]; then
	if [ -f  $HOME/.linux/.chrome/backup/google-chrome ]; then
		rm /opt/google/chrome/google-chrome
		cp $HOME/.linux/.chrome/backup/google-chrome /opt/google/chrome/google-chrome
	fi
fi
if [ -f /usr/bin/chromium ]; then
	if [ -f  $HOME/.linux/.chromium/backup/chromium ]; then
		rm /usr/bin/chromium 
		cp $HOME/.linux/.chromium/backup/chromium /usr/bin/chromium 
	fi
fi
