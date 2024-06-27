#!/bin/bash

check_nvim() {
  if ! command -v nvim &> /dev/null; then
    echo "Installing NeoVim"
    sudo snap install nvim --classic
  else
    echo "NeoVim is installed, moving on"
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

check_nvim
create_nvim_dir
move_files_to_config_dir
