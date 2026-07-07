#!/bin/bash

dotfilesDir=$(pwd)

function linkTo {
  src="${1}"
  dest="${2}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h "${dest}" ]; then
    # Existing symlink
    echo "Removing existing symlink: ${dest}"
    rm ${dest}

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${src} ${dest}
}

function linkDotFileToHome {
  src="${dotfilesDir}/${1}"
  dest="${HOME}/${1}"

  linkTo ${src} ${dest}
}

#linkDotfile .vim
#linkDotfile .vimrc
#linkDotfile .ackrc
linkDotFileToHome .bashrc
linkDotFileToHome .bash_profile
linkDotFileToHome .gitconfig
linkDotFileToHome .git-completion.bash
linkDotFileToHome .zshrc
linkDotFileToHome .p10k.zsh
linkDotFileToHome .tmux.conf
#linkDotfile .goomwwmrc
#linkDotfile .inputrc
#linkDotfile .xinitrc
#linkDotfile .curlrc
#linkDotfile .gf


#mkdir -p $dotfilesDir/.vim/bundle
#cd $dotfilesDir/.vim/bundle
#git clone git://github.com/VundleVim/Vundle.vim.git
#vim +PluginInstall +qall
