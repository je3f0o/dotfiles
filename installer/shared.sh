
function __console_info {
    echo -e "\x1b[36m[INFO]\x1b[0m Trying to install \x1b[32m$@\x1b[0m"
}

function __is_darwin {
    [ `uname` == "Darwin" ]
}

function __jeefo_info {
  __console_info $@
}