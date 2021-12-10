
function update_dotfiles {
  pushd ~/cloud/dotfiles
  git pull origin master && bash setup.sh
  popd
  reload_bashrc
}