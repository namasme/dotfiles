# Installs Telegram

# Download
cd ~
mkdir -p bin
cd bin
wget -O telegram.tar.xz "https://telegram.org/dl/desktop/linux"

# Extract
tar xf telegram.tar.xz
mv Telegram/Telegram ./telegram-desktop
mv Telegram/Updater .

# Cleanup
rmdir Telegram
rm telegram.tar.xz

# Customize grub

sudo rm /etc/default/grub
cd ~/dotfiles/
sudo stow --target=/etc/default --stow grub
sudo update-grub
