if dpkg -s sudo >/dev/null 2>&1; then
    echo "Sudo exists! Installing pkg's"
    sudo apt update
    sudo apt upgrade -y
    sudo apt install -y $(grep -v '^#' packages.txt)
else
    echo "Sudo is not installed! Please install it and continue!"
fi