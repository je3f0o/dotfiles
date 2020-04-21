
JEEFO_ENV_OS_NAME=`uname`
# There is a builtin variable called OSTYPE
# if [[ $OSTYPE == 'darwin'* ]]; then...

function __jeefo_info {
    echo -e "\x1b[36m[INFO]\x1b[0m Trying to install \x1b[32m$@\x1b[0m"
}

function __jeefo_install_brew {
    __jeefo_info Homebrew
    brew --version &> /dev/null
    [ $? != 0 ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

function __jeefo_install_bash_completion {
    __jeefo_info Bash auto-completion
    [ ! -f `brew --prefix`/etc/bash_completion ] && \
        brew install bash-completion
}

function __jeefo_install_git_bash_completion {
    __jeefo_info Git bash-completion
    [ ! -e /usr/local/etc/bash_completion.d/git-completion.bash ] && \
        brew install git bash-completion
}

function __jeefo_install_cmake {
    __jeefo_info CMake
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
    __jeefo_info NVM
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    nvm --version &> /dev/null
    [ $? != 0 ] && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
}

function __jeefo_install_jshint {
    __jeefo_info JSHint
    jshint --version &> /dev/null
    [ $? != 0 ] && npm i jshint -g
}

function __jeefo_install_vim {
    __jeefo_info Vim with plugins
    local has_vim_with_python=1

    vim --version &> /dev/null
    if [ $? != 0 ] || [ `vim --version | grep -c '+python'` == 0 ]; then
        $has_vim_with_python=0
    fi

    if [ $has_vim_with_python == 0 ]; then
        if [ "$JEEFO_ENV_OS_NAME" == "Darwin" ]; then
            brew install vim
        else
            echo Please install Vim with python manually and try again...
            exit 1
        fi
    fi

    # Vundle
    [ ! -d vim/bundle/Vundle.vim ] && mkdir -p vim/bundle && \
        git clone https://github.com/VundleVim/Vundle.vim.git vim/bundle/Vundle.vim

    # Vim plugins
    vim +PluginInstall +qall

    if [ ! -f ~/.ycm_installed ] || [ `cat ~/.ycm_installed` != 1 ]; then
        pushd vim/bundle/YouCompleteMe

        [ "$JEEFO_ENV_OS_NAME" != "Darwin" ] && \
            command -v python3-config &> /dev/null -eq 0 && \
            sudo apt-get install python3-dev -y

        python3 install.py --clangd-completer && echo 1 > ~/.ycm_installed
        popd
    fi
}

function __jeefo_install_powerline_fonts {
    __jeefo_info Powerline Fonts
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
    fi
}

function __jeefo_install {
    # MacOS
    if [ "$JEEFO_ENV_OS_NAME" == "Darwin" ]; then
        # Homebrew
        __jeefo_install_brew
        __jeefo_install_bash_completion
        __jeefo_install_git_bash_completion
    fi

    # CMake
    __jeefo_install_cmake

    # NVM
    __jeefo_install_nvm

    # JSHint
    __jeefo_install_jshint

    # Vim
    __jeefo_install_vim

    # Powerline fonts
    [ "$JEEFO_ENV_OS_NAME" == "Darwin" ] && __jeefo_install_powerline_fonts
}
