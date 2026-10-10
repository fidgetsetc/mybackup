echo "Installing apps..."
echo "Setting up ONLYOFFICE..."
sudo yum install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm
echo "Done."
echo "Setting up Sublime..."
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
echo "Done."
echo "Setting up GitHub Desktop Plus"
sudo rpm --import https://gpg.desktop-plus.org/public.key
echo -e "[desktop-plus]\nname=Desktop Plus\nbaseurl=https://rpm.desktop-plus.org/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gpg.desktop-plus.org/public.key" | sudo tee /etc/yum.repos.d/desktop-plus.repo
echo "Done."
echo "Installing all packages..."
sudo dnf install chromium gnome-software gnome-boxes zsh kitty onlyoffice-desktopeditors sublime-text desktop-plus --skip-unavailable
echo "Complete with all tasks."
