zplug "zplug/zplug"

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

zplug "modules/completion", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/docker", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/environment", from:prezto
zplug "modules/git", from:prezto
zplug "modules/history", from:prezto
zplug "modules/history-substring-search", from:prezto, defer:2
zplug "modules/osx", from:prezto
zplug "modules/rails", from:prezto
zplug "modules/ssh", from:prezto
zplug "modules/syntax-highlighting", from:prezto, defer:2
zplug "modules/utility", from:prezto

zplug "akarzim/2bd1012f3047585b19cdfad4937895b3", from:gist, \
    on:"sindresorhus/pure", \
    if:"(( $+commands[docker] ))"

zplug "akarzim/7b2f24c7f0dee222b662f35f5bba497a", from:gist, \
    use:"git-aliases.zsh", \
    if:"(( $+commands[git] ))"

zplug "akarzim/57cf090edf53acb082ff44d38fcea259", from:gist, \
    use:"exa-aliases.zsh", \
    if:"(( $+commands[exa] ))", \
    defer:2

zplug "rupa/z", use:z.sh, defer:2

zplug "tmuxinator/tmuxinator", use:"completion/tmuxinator.zsh"
