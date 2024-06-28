#!/bin/bash

check_dependencies() {
  for cmd in wget unzip; do
    if ! command -v $cmd &> /dev/null; then
      echo "Installing $cmd..."
      sudo apt-get install -y $cmd &> /dev/null
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
    echo "Creating nvim/ inside ~/.config/"
    mkdir -p ~/.config/nvim
  fi
}

move_files_to_config_dir() {
  echo "Moving cloned files to .config/nvim directory"
  mv init.lua lua/ ~/.config/nvim
}

download_and_unzip_fonts() {
  echo "Downloading and installing Hack Nerd Font..."
  wget -q "https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip"
  sudo unzip -q Hack-v3.003-ttf.zip -d /usr/share/fonts/Hack-v3.003-ttf/ 
  sudo fc-cache -f -v &> /dev/null
}

delete_cloned_repository() {
  read -p "Do you want to delete the cloned repository?(Yes/No) " user_answer
  user_answer=$(echo "$user_answer" | tr '[:upper:]' '[:lower:]')

  if [ "$user_answer" == "yes" ]; then
    echo "Deleting cloned repository, all the necessery files were moved"
    sudo rm -rf "$(pwd)"
  else
    echo "Cloned repository not deleted"
  fi
}

check_dependencies
check_nvim
create_nvim_dir
move_files_to_config_dir
download_and_unzip_fonts

echo "Setup is done! Please start Neovim with \"nvim\" command to finish the Lazy.nvim plugin installation."

delete_cloned_repository
