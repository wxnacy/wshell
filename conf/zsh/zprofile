# echo '.zprofile' >> /tmp/zshmsg
# echo '.zprofile'
echo 'source ~/.zprofile'

if [ -d "${HOME}/.pyenv" ]; then
    # https://github.com/pyenv/pyenv#basic-github-checkout
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    export PYTHON_CONFIGURE_OPTS="--enable-framework"
    # config for vim plugin YouComplateMe
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)";
fi

if [ -d "${HOME}/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion"  ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# for python
# source /usr/local/opt/autoenv/activate.sh

# CFLAGS="-I$(brew --prefix openssl)/include" \
# LDFLAGS="-L$(brew --prefix openssl)/lib"
