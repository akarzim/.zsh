#
# Executes commands at the start of an interactive session.
#

# zmodload zsh/zprof

# Install zplug if not exists
[[ -d ~/.zplug ]] || {
  curl -fLo ~/.zplug/zplug --create-dirs git.io/zplug
  source ~/.zplug/init.sh
  zplug update --self
}

# Source zplug
source ~/.zplug/init.zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

if zplug check sorin-ionescu/prezto; then
    # Color output (auto set to 'no' on dumb terminals).
    zstyle ':prezto:*:*' color 'yes'
fi

# Editor
if zplug check modules/editor; then
    # Set the key mapping style to 'emacs' or 'vi'.
    zstyle ':prezto:module:editor' key-bindings 'vi'
    # Auto convert .... to ../..
    zstyle ':prezto:module:editor' dot-expansion 'yes'
fi

# Git
if zplug check modules/git; then
    # Ignore submodules when they are 'dirty', 'untracked', 'all', or 'none'.
    zstyle ':prezto:module:git:status:ignore' submodules 'all'
    # Set the format of the git-log output to 'brief', 'oneline', or 'medium'.
    zstyle ':prezto:module:git:log:context' format 'oneline'
fi

# SSH
if zplug check modules/ssh; then
    # Set the SSH identities to load into the agent.
    zstyle ':prezto:module:ssh:load' identities 'id_rsa' 'id_rsa2' 'id_github' 'synbioz'
fi

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

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load

# Customize to your needs...

# init MacTeX
# eval `/usr/libexec/path_helper -s`

# Load rbenv automatically
eval "$( command rbenv init - )"

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
