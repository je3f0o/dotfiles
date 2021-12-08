
function update_dotfiles {
  pushd ~/cloud/dotfiles
  git remote update origin --prune || exit 1
  source ~/.bash/plugins/reload_bashrc/reload_bashrc.plugin.sh && reload_bashrc
  popd
}