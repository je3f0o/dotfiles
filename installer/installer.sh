
function __jeefo_install_monaco {
  __jeefo_info 'Monaco Bold font'

  [ -f ~/.fonts/MonacoB-Bold.ttf ] && return 0

  fontforge --version &> /dev/null
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

function __jeefo_install_bash_completion {
  __jeefo_info 'Bash auto-completion'
  [ ! -f `brew --prefix`/etc/bash_completion ] && \
    brew install bash-completion
}

function __jeefo_install_gnu_core_utils {
  gls --version &> /dev/null
  [ $? != 0 ] && brew install coreutils
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
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && \
    printf %s "${HOME}/.nvm" || \
    printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

  nvm --version &> /dev/null
  [ $? != 0 ] && curl -s -o- \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

  node --version &> /dev/null
  [ $? != 0 ] && nvm install node
}

function __jeefo_install_jshint {
  __jeefo_info 'JSHint'
  jshint --version &> /dev/null
  if [ $? != 0 ]; then
    npm --version &> /dev/null
    [ $? == 0 ] && npm i jshint -g
  fi
}

function __jeefo_install_vim {
  __jeefo_info 'Vim with plugins'
  local has_vim=0
  local has_python=0
  local has_clipboard=0

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

  if __is_darwin; then
    if [ $has_vim == 0 ] || [ $has_python == 0 ]; then
      brew install vim
      brew link vim
    fi
  else
    if [ $has_clipboard == 0 ]; then
      #sudo apt-get install vim-gnome -y
      sudo apt-get install vim-gtk3 -y
    elif [ $has_vim == 0 ] || [ $has_python == 0 ]; then
      sudo apt-get install vim -y
    fi
  fi

  # Vundle
  [ ! -d vim/bundle/Vundle.vim ] && mkdir -p vim/bundle && \
    git clone https://github.com/VundleVim/Vundle.vim.git \
         vim/bundle/Vundle.vim

  # Vim plugins
  vim +PluginInstall +qall

  if [ ! -f ~/.ycm_installed ] || [ `cat ~/.ycm_installed` != 1 ]; then
    pushd vim/bundle/YouCompleteMe
    git submodule update --init --recursive
    python3 install.py --clangd-completer --go-completer && \
      echo 1 > ~/.ycm_installed
    popd
  fi

  # Tern for vim
  if [ ! -d ~/.vim/bundle/tern_for_vim/node_modules ]; then
    pushd vim/bundle/tern_for_vim
    npm i
    popd
  fi
}

function __jeefo_install_powerline_fonts {
  __jeefo_info 'Powerline Fonts'

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
}

function __jeefo_install_tmux {
  __jeefo_info 'Tmux'
  tmux -V &> /dev/null
  [ $? != 0 ] && brew install tmux
}

function __jeefo_pygmentize {
  __jeefo_info 'Pygments'
  pygmentize -V &> /dev/null
  if [ $? != 0 ]; then
    if __is_darwin; then
      brew install pygments
    else
      sudo apt-get install python3-pygments -y
    fi
  fi
}

function __jeefo_install {
  if __is_darwin; then
    # Homebrew
    __jeefo_install_bash_completion
    __jeefo_install_git_bash_completion

    # GNU Core utils
    __jeefo_install_gnu_core_utils

    # Tmux MacOS
    __jeefo_install_tmux

    # Powerline
    __jeefo_install_powerline_fonts
  else
    sudo apt-get update && sudo apt-get install -y \
      tmux \
      xsel \
      cmake \
      fontforge \
      python3-dev \
      fonts-powerline \
      build-essential

    __jeefo_install_monaco
  fi

  # Vim
  __jeefo_install_vim

  # Pygmentize
  __jeefo_pygmentize

  if [ -z DOCKER_BUILD ]; then
    # Node
    __jeefo_install_nvm
    __jeefo_install_jshint
  fi
}