#!/usr/bin/env bash

WSHELL_HOME=${HOME}/.wshell

test -d ${WSHELL_HOME} || git clone https://github.com/wxnacy/wshell ${WSHELL_HOME}


if [[ ! $PATH =~ '.wshell/bin' ]];then
    echo 'WARNING: seems you still have not added 'wshell' to the load path.'
    echo ''
    echo '# Load pyenv automatically by adding'
    echo '# the following to ~/.bash_profile:'
    echo 'export PATH="${HOME}/.wshell/bin:$PATH"'
fi
