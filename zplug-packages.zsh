zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug "junegunn/fzf", \
    hook-build:"
    {
      $ZPLUG_REPOS/junegunn/fzf/install
    } &>/dev/null"

zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*", \
    hook-load:"
    {
      [ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
    } &>/dev/null"

zplug "akarzim/.zsh", use:init.zsh, from:github

zplug "zsh-users/zsh-syntax-highlighting", defer:2
# This module must be loaded after the syntax-highlighting module
zplug "zsh-users/zsh-history-substring-search", defer:2
# This module must be loaded after the utility module
zplug "zsh-users/zsh-completions", use:src

zplug "akarzim/zsh-docker-aliases", from:github, \
    if:"(( $+commands[docker] ))"

zplug "akarzim/zsh-plungy-aliases", from:github, \
    use:"alias.zsh"
