#!/bin/sh
brew install fzf
brew install zsh-syntax-highlighting
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
brew install zsh-fast-syntax-highlighting
echo "source $(brew --prefix)/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh">> ${ZDOTDIR:-$HOME}/.zshrc
#[oh-my-zsh] plugin 'fast-syntax-highlighting' not found
