
function update_dotfiles {
  pushd ~/cloud/dotfiles
  git pull origin master || exit 1
  __is_darwin && source ~/.bash_profile || source ~/.bashrc
  popd
}