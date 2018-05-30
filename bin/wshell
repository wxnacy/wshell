#!/usr/bin/env bash

CMD=$1


if [ ! $CMD ];then
    echo 'wshell 1.0.0'
    echo 'Usage: wshell <command> [<args>]'
    echo ''
    echo 'Some useful pyenv commands are:'
    echo '  update  update the wshell version'
    echo '  install  Install software by name'

fi

main(){
    if [ $CMD == 'update' ];then
        NPWD=${PWD}
        cd ${HOME}/.wshell
        git pull
        cd ${NPWD}

    fi
}


USAGE='


   commands    List all available pyenv commands\n
   local       Set or show the local application-specific Python version
   global      Set or show the global Python version
   shell       Set or show the shell-specific Python version
   install     Install a Python version using python-build
   uninstall   Uninstall a specific Python version
   rehash      Rehash pyenv shims (run this after installing executables)
   version     Show the current Python version and its origin
   versions    List all Python versions available to pyenv
   which       Display the full path to an executable
   whence      List all Python versions that contain the given executable

See `pyenv help <command>` for information on a specific command.
For full documentation, see: https://github.com/yyuu/pyenv#readme'
