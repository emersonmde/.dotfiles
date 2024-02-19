#!/usr/bin/env bash

# Install Homebrew on macOS
install_homebrew() {
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# Install Ansible on macOS
install_ansible_macos() {
    echo "Updating Homebrew..."
    brew update
    echo "Installing Ansible with Homebrew..."
    brew install ansible
}

# Install Ansible on Debian/Ubuntu
install_ansible_debian() {
    echo "Updating package lists..."
    sudo apt-get update
    echo "Installing software-properties-common..."
    sudo apt-get install -y software-properties-common
    echo "Adding Ansible's official PPA..."
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    echo "Installing Ansible..."
    sudo apt-get install -y ansible
}

# Install Ansible on Fedora
install_ansible_fedora() {
    echo "Installing Ansible with dnf..."
    sudo dnf install -y ansible
}

# Install Ansible on Arch Linux
install_ansible_arch() {
    echo "Installing Ansible with pacman..."
    sudo pacman -Sy ansible --noconfirm
}

OS="unknown"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ -f /etc/debian_version ]; then
        OS="debian"
    elif [ -f /etc/redhat-release ]; then
        OS="fedora"
    elif [ -f /etc/arch-release ]; then
        OS="arch"
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
fi

case $OS in
    debian)
        install_ansible_debian
        ;;
    fedora)
        install_ansible_fedora
        ;;
    arch)
        install_ansible_arch
        ;;
    macos)
        if ! command -v brew >/dev/null 2>&1; then
            install_homebrew
        else
            echo "Homebrew is already installed."
        fi
        install_ansible_macos
        ;;
    *)
        echo "Unsupported operating system."
        ;;
esac

