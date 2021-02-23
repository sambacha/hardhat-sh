#!/bin/bash 
# shellcheck disable=SC2034,SC2059
# hardcode flag enable 
installed_flag=1

setup_color() {
  # Only use colors if connected to a terminal
  if [ -t 1 ]; then
    RED=$(printf '\033[31m')
    GREEN=$(printf '\033[32m')
    YELLOW=$(printf '\033[33m')
    BLUE=$(printf '\033[34m')
    BOLD=$(printf '\033[1m')
    RESET=$(printf '\033[m')
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    RESET=""
  fi
}

install_hardhat() {
  echo "Installing Hardhat ..."
if ! node --version; then
 npm install -D hardhat hardhat-deploy ethereum-waffle prettier prettier-plugin-solidity solhint solhint-plugin-prettier
  else
    echo "Looks like there was an error while trying to use NodeJS"
    exit 0
  fi
}

completed() {
  printf '\n'
  printf "$GREEN" 
  echo "HardHat was successfully installed."
  echo "To use HardHat in your current shell run:"
  echo "source \$HOME/.HardHat/source.sh"
  echo "When you open a new shell this will be performed automatically."
  echo "To see what HardHat's CLI can do you can check the documentation bellow."
  echo "https://docs.HardHat.org/"
  printf "$RESET" 
  exit 0
}

main() {
  setup_color
  if [ $installed_flag -eq 1 ]; then
    install_hardhat
    completed
  else
    completed    
  fi
}

main
