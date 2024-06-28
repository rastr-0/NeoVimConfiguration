#!/bin/bash

check_dependencies() {
  for cmd in wget unzip; do
    if ! command -v $cmd &> /dev/null; then
      echo "Installing $cmd..."
      sudo apt-get install -y $cmd
    fi
  done
}

check_nvim() {
  if ! command -v nvim &> /dev/null; then
    echo "Installing NeoVim..."
    sudo snap install nvim --classic &> /dev/null
  fi
}

create_nvim_dir() {
  if [ ! -d ~/.config/ ]; then
    echo "Creating ./config/nvim directory"
    mkdir -p ~/.config/nvim
  elif [ ! -d ~/.config/nvim/ ]; then
    echo "Creating nvim/ inside .config/"
    mkdir -p ~/.config/nvim
  fi
}

move_files_to_config_dir() {
  echo "Moving cloned files to .config/nvim directory"
  mv init.lua lua/ README.md ~/.config/nvim
}

download_and_unzip_fonts() {
 echo "Downloading and installing Hack Nerd Font..."
 wget -q "https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip"
 sudo unzip -q Hack-v3.003-ttf.zip -d /usr/share/fonts/Hack-v3.003-ttf/ 
}

check_dependencies
check_nvim
create_nvim_dir
move_files_to_config_dir
download_and_unzip_fonts

echo "Setup complete. Please start Neovim with \"nvim\" command to finish Lazy.nvim plugin installation."
