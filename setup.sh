#!/bin/bash

export PATH=$PATH:/home/gabriel/dotfiles/bin:/home/gabriel/dotfiles/bin/install

echo "export PATH=$PATH:/home/gabriel/dotfiles/bin:/home/gabriel/dotfiles/bin/install" >> ~/.zshrc
echo "export PATH=$PATH:/home/gabriel/dotfiles/bin:/home/gabriel/dotfiles/bin/install" >> ~/.bashrc

# or ln -s
cp -R * ~/
