#!/usr/bin/zsh

### Path

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

### Editor

# Make emacs the default editor.
export EDITOR='emacsclient'

# Tell emacsclient to launch an emacs daemon if none is running.
# See emacsclient(1) --alternate-editor
export ALTERNATE_EDITOR='';

### Python

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Set up pyenv
export PATH=$HOME/.pyenv/bin:$PATH

### Node

# Set up nvm

export NVM_DIR="$HOME/.nvm"
