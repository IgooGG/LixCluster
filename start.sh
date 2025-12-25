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
    echo "Done! Installing font..."
    mkdir -p ~/.local/share/fonts
else
    echo "Sudo is not installed. Please install it and try again!"
fi