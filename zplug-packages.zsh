zplug "zplug/zplug"

zplug 'sindresorhus/pure', \
    hook-build:"
    {
      ln -sf $ZPLUG_REPOS/sindresorhus/pure/pure.zsh $HOME/.zfunctions/prompt_pure_setup
      ln -sf $ZPLUG_REPOS/sindresorhus/pure/async.zsh $HOME/.zfunctions/async
    } &>/dev/null", \
    hook-load:"
    {
      autoload -U promptinit; promptinit
      prompt pure
    } &>/dev/null"

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

zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/osx", from:prezto
zplug "modules/git", from:prezto
zplug "modules/history-substring-search", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/rails", from:prezto

zplug "akarzim/zsh-docker-aliases"
zplug "akarzim/zsh-git-flow-aliases"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "akarzim/2bd1012f3047585b19cdfad4937895b3", \
    from:gist, \
    on:"sindresorhus/pure", \
    if:"(( $+commands[docker] ))"
