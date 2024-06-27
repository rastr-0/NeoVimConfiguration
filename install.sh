check_nvim() {
  if ! command -v nvim &> /dev/null
  then
    sudo snap install nvim --classic
    echo "Installing NeoVim"
  else
    echo "NeoVim is installed, moving on"
  fi
}

echo $(check_nvim)
