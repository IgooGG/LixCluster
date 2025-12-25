set -e

if dpkg -s sudo >/dev/null 2>&1; then
    echo "Sudo exists! Installing pkg's."
    sudo apt update
    sudo apt upgrade -y
    sudo apt install -y $(grep -v '^#' packages.txt)
    echo "Done! Installing oh-my-posh..."
    curl -s https://ohmyposh.dev/install.sh | bash -s
    echo "Done! Downloading custom oh-my-posh theme..."
    curl -L https://raw.githubusercontent.com/IgooGG/LixCluster/refs/heads/main/atomic2.omp.json \-o ~/.cache/oh-my-posh/themes/atomic2.omp.json
    echo "Done! Changing shell for your account..."
    echo "Password may be required!"
    chsh -s /usr/bin/fish
    #echo "Done! Installing font..."
    #mkdir -p ~/.local/share/fonts
    #cp Font/JetBrainsMono/* ~/.local/share/fonts/
    #fc-cache -fv
    echo "Done. You need to change it manually!"
    echo "Creating fish resources..."
    fish
    exit
    echo "Done! Changing fish settings..."
    curl -L https://raw.githubusercontent.com/IgooGG/LixCluster/refs/heads/main/config.fish \-o ~/.config/fish/config.fish
    echo "Done!"
    clear
    echo "Next steps:"
    echo "  1. Set font to JetBrains Mono NerdFont (It was downloaded by this script)."
    echo "  2. Restart PC to update default shell. (You can use {sudo systemctl reboot} )."
    echo "Thats all thanks for using Linux Shell Tools (LixCluster)"
    echo "  _      _             _           _             "
    echo " | |    (_)           | |         | |            "
    echo " | |     ___  __   ___| |_   _ ___| |_ ___ _ __  "
    echo " | |    | \ \/ /  / __| | | | / __| __/ _ \ '__| "
    echo " | |____| |>  <  | (__| | |_| \__ \ ||  __/ |    "
    echo " |______|_/_/\_\  \___|_|\__,_|___/\__\___|_|    "
    echo "                                                 "
    echo "                                       By IgooGG "
    echo "                                                 "
else
    echo "Sudo is not installed. Please install it and try again!"
fi