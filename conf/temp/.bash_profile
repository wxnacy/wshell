
# . ${HOME}/.wshell/bin/conf/.bash_aliases
. ${0/%bash_profile/bash_aliases}



if [ -d "${HOME}/.pyenv" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)";
fi



