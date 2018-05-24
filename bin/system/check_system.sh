#!/usr/bin/env bash

SYS=''
VER=''

HAS_RELEASE=`test -f /etc/os-release && echo 'yes'`

check_system(){
    OS=`uname -s`
    if [ ${OS} == "Darwin"  ];then
        SYS=${OS}
        # 查看版本信息，并截取版本号
        INFO=`sw_vers`
        ARR=(${INFO})
        VER=${ARR[5]}
    elif [ ${OS} == "Linux"  ];then

        if [ ${HAS_RELEASE} ]
        then
            source /etc/os-release
            SYS=$ID
            VER=$VERSION_ID

            # case $ID in
                # debian|ubuntu|devuan)
                    # PKG='apt'
                    # SYS='ubuntu'
                    # ;;
                # centos|fedora|rhel)
                    # PKG="yum"
                    # SYS="centos"
                    # # if test "$(echo "$VERSION_ID >= 22" | bc)" -ne 0;
                    # # then
                        # # PKG="dnf"
                    # # fi
                    # ;;
                # *)
                    # exit 1
                    # ;;
            # esac

        else
            ISSUE=`cat /etc/issue`
            if [[ $ISSUE =~ 'CentOS release 6' ]]
            then
                SYS='centos'
                VER=6
            fi

        fi

    else
        echo "Other OS: ${OS}"
    fi

    echo "${SYS} ${VER}"
}

check_system
