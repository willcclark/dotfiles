# ~/.config/fish/functions/nvm.fish
function nvm
  bass source ~/.config/nvm/nvm.sh --no-use ';' nvm $argv
end