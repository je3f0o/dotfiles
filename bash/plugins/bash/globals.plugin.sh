
function update_dotfiles {
  pushd ~/cloud/dotfiles
  git remote update origin --prune
  popd
}