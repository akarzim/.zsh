# Source file on directory open

autoload -U add-zsh-hook
load-local-conf() {
  # check file exists, is regular file and is readable:
  if [[ -a .source_me ]]; then
    source .source_me
    echo "custom zsh configuration sourced!"
  fi
}
add-zsh-hook chpwd load-local-conf
