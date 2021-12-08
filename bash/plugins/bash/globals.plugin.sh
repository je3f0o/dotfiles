
function update_dotfiles {
  pushd ~/cloud/dotfiles
  git remote update origin --prune || exit 1
  __is_darwin && source ~/.bash_profile || source ~/.bashrc
  popd
}