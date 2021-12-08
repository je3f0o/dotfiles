
function update_dotfiles {
  pushd ~/cloud/dotfiles
  git remote update origin --prune || exit 1
  source ~/.bash_profile
  popd
}