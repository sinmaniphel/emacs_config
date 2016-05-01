#!/bin/bash

# installing cask, a lisp dependency manager (dependency managers everywhere whooooooooooo !)

# installing from git repo, so that the .cask file is generated in the ~ directory
# Strangely, there is no apt package

if [[ ! -e ~/.cask ]]
then
echo "Cloning Cask repo"
    git clone git@github.com:cask/cask.git ~/.cask
fi

# Adding the cask binary to the path
if [[ $(grep "cask/bin" ~/.bash_profile) == "" ]]
then
echo "Adding \$HOME/.cask/bin to \$PATH in ~/.bash_profile"
    echo '' >> ~/.bash_profile
    echo "# Added by ~/.emacs.d/install.sh" >> ~/.bash_profile
    echo "export PATH=\$HOME/.cask/bin:\$PATH" >> ~/.bash_profile
fi

export PATH=$HOME/.cask/bin:$PATH

cd ~/.emacs.d
cask install

# For Python / ELPY
# Prerequisite: Install Python as per:
# http://docs.python-guide.org/en/latest/#getting-started
pip install --upgrade elpy flake8 rope jedi ipython
