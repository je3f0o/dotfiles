
function update_dotfiles {
  pushd ~/cloud/dotfiles
  git pull origin master || exit 1
  bash setup.sh
  popd
}