#!/bin/bash

check_nvim() {
  if ! command -v nvim &> /dev/null; then
    echo "Installing NeoVim..."
    sudo snap install nvim --classic
  fi
}

create_nvim_dir() {
  if [! -d ~/.config/ ]; then
    echo "Creating ./config/nvim directory"
    mkdir -p ~/.config/nvim
  elif [! -d ~/.config/nvim/ ]; then
    echo "Creating nvim/ inside .config/"
    mkdir -p ~/.config/nvim
  fi
}

move_files_to_config_dir() {
  echo "Moving cloned files to .config/nvim directory"
  mv init.lua ~/.config/nvim
  mv -R lua ~/.config/nvim
}

download_and_move_fonts() {
 if ! command -v unzip &> /dev/null; then
  echo "Installing unzip..."
  sudo apt-get install unzip
 fi
 echo "Downloading and installing Hack Nerd Font..."
 wget "https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip"
 unzip Hack-v3.003-ttf.zip -d /usr/share/fonts/Hack-v3.003-ttf/ 
}

check_nvim
create_nvim_dir
move_files_to_config_dir
download_and_move_fonts
