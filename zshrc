#
# Executes commands at the start of an interactive session.
#

# zmodload zsh/zprof

# Install zplug if not exists
# if [[ ! -d ~/.zplug ]]; then
#   curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# fi

# Source zplug
source ~/.zplug/init.zsh

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
# if ! zplug check; then
#     zplug install
# fi

# FZF
if zplug check junegunn/fzf-bin; then
  # setting if FZF is available
  # export FZF_DEFAULT_COMMAND='ag -g ""'

  # --files: List files that would be searched but do not search
  # --no-ignore: Do not respect .gitignore, etc...
  # --hidden: Search hidden files and folders
  # --follow: Follow symlinks
  # --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_DEFAULT_OPTS='--color=16'
  # export FZF_DEFAULT_OPTS='
  #   --color fg:124,bg:16,hl:202,fg+:214,bg+:52,hl+:231
  #   --color info:52,prompt:196,spinner:208,pointer:196,marker:208
  # '
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Customize to your needs...
zstyle ':akarzim:*:*' color 'yes'
zstyle ':akarzim:module:git:log:context' format 'oneline'
zstyle ':akarzim:module:ssh:load' identities 'id_rsa' 'id_rsa2' 'id_github' 'synbioz'

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load

# init MacTeX
# eval `/usr/libexec/path_helper -s`

# init PYenv
pyenv() {
    eval "$( command pyenv init - )"
    pyenv "$@"
}

# HomeBrew
test -f "${HOME}/.homebrew.sh" && source "${HOME}/.homebrew.sh"

# added by travis gem
# test -f "${HOME}/.travis/travis.sh" && source "${HOME}/.travis/travis.sh"

# iTerm2
test -f "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Source Tmuxinator
# test -f "${HOME}/.tmuxinator.zsh" && source "${HOME}/.tmuxinator.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi

# starship prompt
if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

# Java Developer Kit
test -d "/usr/local/opt/openjdk/bin" && export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Added by plungy
fpath=(~/.plungy/autocomplete $fpath)

# zprof
