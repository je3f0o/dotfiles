
function update_dotfiles {
  pushd ~/cloud/dotfiles
  git remote update origin --prune && bash_reload
  popd
}