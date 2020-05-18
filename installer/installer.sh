
function __jeefo_info {
    echo -e "\x1b[36m[INFO]\x1b[0m Trying to install \x1b[32m$@\x1b[0m"
}

function __jeefo_install_monaco {
    __jeefo_info 'Monaco Bold font'

    [ -f ~/.fonts/MonacoB-Bold.ttf ] && return 0

    curl --version &> /dev/null
    if [ $? != 0 ]; then
        sudo apt-get install fontforge -y
    fi

    mkdir -p ~/.fonts && pushd ~/.fonts
    if [ $? == 0 ]; then
        git clone https://github.com/vjpr/monaco-bold
        if [ $? != 0 ]; then
            return 1;
        fi
    fi

    fontforge -lang=ff -c 'Open($1); Generate($2)' \
        monaco-bold/Monaco.dfont Monaco.ttf

    fontforge -lang=ff -c 'Open($1); Generate($2)' \
        monaco-bold/MonacoB/MonacoB.otf MonacoB.ttf
    fontforge -lang=ff -c 'Open($1); Generate($2)' \
        monaco-bold/MonacoB/MonacoB-Bold.otf MonacoB-Bold.ttf

    fontforge -lang=ff -c 'Open($1); Generate($2)' \
        monaco-bold/MonacoBSemi/Monaco-Bold.otf MonacoBSemi.ttf

    fontforge -lang=ff -c 'Open($1); Generate($2)' \
        monaco-bold/MonacoB2/MonacoB2.otf MonacoB2.ttf
    fontforge -lang=ff -c 'Open($1); Generate($2)' \
        monaco-bold/MonacoB2/MonacoB2-Bold.otf MonacoB2-Bold.ttf

    fontforge -lang=ff -c 'Open($1); Generate($2)' \
        monaco-bold/MonacoB-With-Italic/MonacoB-Bold-Italic.otf \
        MonacoB-Bold-Italic.ttf

    rm -rf monaco-bold

    popd
}

function __jeefo_install_curl {
    __jeefo_info 'Curl'
    curl --version &> /dev/null
    if [ $? != 0 ]; then
        if [ "$JEEFO_ENV_OS_NAME" != "Darwin" ]; then
            sudo apt-get install curl -y
        fi
    fi
}

function __jeefo_install_brew {
    __jeefo_info 'Homebrew'
    brew --version &> /dev/null
    [ $? != 0 ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

function __jeefo_install_bash_completion {
    __jeefo_info 'Bash auto-completion'
    [ ! -f `brew --prefix`/etc/bash_completion ] && \
        brew install bash-completion
}

function __jeefo_install_git_bash_completion {
    __jeefo_info 'Git bash-completion'
    [ ! -e /usr/local/etc/bash_completion.d/git-completion.bash ] && \
        brew install git bash-completion
}

function __jeefo_install_cmake {
    __jeefo_info 'CMake'
    cmake --version &> /dev/null
    if [ $? != 0 ]; then
        if [ "$JEEFO_ENV_OS_NAME" == "Darwin" ]; then
            brew install cmake
        else
            sudo apt-get install cmake -y
        fi
    fi
}

function __jeefo_install_nvm {
    __jeefo_info 'NVM'
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    nvm --version &> /dev/null
    [ $? != 0 ] && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
}

function __jeefo_install_jshint {
    __jeefo_info 'JSHint'
    jshint --version &> /dev/null
    [ $? != 0 ] && npm i jshint -g
}

function __jeefo_install_vim {
    local has_vim=0
    local has_python=0
    local has_clipboard=0
    __jeefo_info 'Vim with plugins'

    vim --version &> /dev/null
    if [ $? == 0 ]; then
        has_vim=1
        if [ `vim --version | grep -c '+python'` != 0 ]; then
            has_python=1
        fi
        if [ `vim --version | grep -c '+clipboard'` != 0 ]; then
            has_clipboard=1
        fi
    fi

    if [ "$JEEFO_ENV_OS_NAME" == "Darwin" ]; then
        if [ $has_vim == 0 ] || [ $has_python == 0 ]; then
            brew install vim
        fi
    else
        if [ $has_clipboard == 0 ]; then
            sudo apt-get install vim-gnome -y
        elif [ $has_vim == 0 ] || [ $has_python == 0 ]; then
            sudo apt-get install vim -y
        fi
    fi

    # Vundle
    [ ! -d vim/bundle/Vundle.vim ] && mkdir -p vim/bundle && \
        git clone https://github.com/VundleVim/Vundle.vim.git vim/bundle/Vundle.vim

    # Vim plugins
    vim +PluginInstall +qall

    if [ ! -f ~/.ycm_installed ] || [ `cat ~/.ycm_installed` != 1 ]; then
        pushd vim/bundle/YouCompleteMe

        if [ "$JEEFO_ENV_OS_NAME" != "Darwin" ]; then
            command -v python3-config &> /dev/null
            if [ $? -ne 0 ]; then 
                sudo apt-get install python3-dev -y
            fi 
        fi 

        python3 install.py --clangd-completer && echo 1 > ~/.ycm_installed
        popd
    fi
}

function __jeefo_install_xsel {
    __jeefo_info 'XSel for Vim copy to clipboard'
    xsel --version &> /dev/null
    [ $? != 0 ] && sudo apt-get install xsel -y
}

function __jeefo_install_powerline_fonts {
    __jeefo_info 'Powerline Fonts'

    if [ "$JEEFO_ENV_OS_NAME" == "Darwin" ]; then
        if [ ! -f ~/Library/Fonts/Inconsolata\ for\ Powerline.otf ]; then
            pushd /tmp

            # Clone
            git clone https://github.com/powerline/fonts.git --depth=1
            # install
            cd fonts
            ./install.sh
            # clean up
            cd ..
            rm -rf fonts

            popd
        fi
    else
        local __=`apt list --installed 2> /dev/null | grep -c fonts-powerline`
        [ $__ == 0 ] && sudo apt-get install fonts-powerline -y
    fi
}

function __jeefo_install {
    # Curl
    __jeefo_install_curl

    # Homebrew
    if [ "$JEEFO_ENV_OS_NAME" == "Darwin" ]; then
        __jeefo_install_brew
        __jeefo_install_bash_completion
        __jeefo_install_git_bash_completion
    else
        local __=`apt list --installed 2> /dev/null | grep -c build-essential`
        [ $__ == 0 ] && sudo apt-get install build-essential -y
    fi

    # CMake
    __jeefo_install_cmake

    # NVM
    __jeefo_install_nvm

    # JSHint
    __jeefo_install_jshint

    # Vim
    __jeefo_install_vim

    # XSel
    [ "$JEEFO_ENV_OS_NAME" != "Darwin" ] && __jeefo_install_xsel

    # Powerline fonts
    __jeefo_install_powerline_fonts

    # Monaco bold font
    [ "$JEEFO_ENV_OS_NAME" != "Darwin" ] && __jeefo_install_monaco
}
