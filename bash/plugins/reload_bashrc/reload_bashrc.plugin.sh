
function reload_bashrc {
  __is_darwin && source ~/.bash_profile || source ~/.bashrc
}