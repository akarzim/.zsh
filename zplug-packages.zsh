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

zplug "akarzim/zsh-docker-aliases", from:github, \
    if:"(( $+commands[docker] ))"

zplug "akarzim/zsh-plungy-aliases", from:github, \
    if:"(( $+commands[docker] ))"

zplug "modules/completion", from:prezto
zplug "modules/directory", from:prezto
# zplug "modules/docker", from:prezto
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

zplug "akarzim/6a0d679ef8e61d728be47bd7f47362de", from:gist, \
    use:"zsh-docker-bang-aliases.zsh", \
    if:"(( $+commands[docker] ))"

zplug "akarzim/7b2f24c7f0dee222b662f35f5bba497a", from:gist, \
    use:"git-aliases.zsh", \
    if:"(( $+commands[git] ))"

zplug "akarzim/37968ac711fc49d4ef38cdaba4997b8f", from:gist, \
    use:"ruby-aliases.zsh", \
    if:"(( $+commands[ruby] ))"

zplug "akarzim/c279facda5850c656b44acea71397650", from:gist, \
    use:"readme-aliases.zsh"

zplug "akarzim/e77af454042a447812f7fd765fd32007", from:gist, \
    use:"orig-aliases.zsh"

zplug "akarzim/57cf090edf53acb082ff44d38fcea259", from:gist, \
    use:"exa-aliases.zsh", \
    if:"(( $+commands[exa] ))", \
    defer:2

zplug "akarzim/40685dbdbc269115e372e801dee24072", from:gist, \
    use:"ncdu-aliases.zsh", \
    if:"(( $+commands[ncdu] ))", \
    defer:2

zplug "rupa/z", use:z.sh, defer:2

zplug "tmuxinator/tmuxinator", use:"completion/tmuxinator.zsh"
