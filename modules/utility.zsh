# Defines general aliases and functions.

# Correct commands.
if zstyle -T ':akarzim:module:utility' correct; then
  setopt CORRECT
fi

#
# Aliases
#

# Disable correction.
alias ack='nocorrect ack'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias ebuild='nocorrect ebuild'
alias gcc='nocorrect gcc'
alias gist='nocorrect gist'
alias grep='nocorrect grep'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias rm='nocorrect rm'

# Disable globbing.
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'
alias history='noglob history'
alias locate='noglob locate'
alias rake='noglob rake'
alias rsync='noglob rsync'
alias scp='noglob scp'
alias sftp='noglob sftp'

# Define general aliases.
alias _='sudo'
alias b='${(z)BROWSER}'

alias diffu="diff --unified"
alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias p='${(z)PAGER}'

# Safe ops. Ask the user before doing anything destructive.
alias rmi="${aliases[rm]:-rm} -i"
alias mvi="${aliases[mv]:-mv} -i"
alias cpi="${aliases[cp]:-cp} -i"
alias lni="${aliases[ln]:-ln} -i"

# ls
if zstyle -t ':akarzim:module:utility:ls' color; then
  # Define colors for BSD ls if they're not already defined
  if [[ -z "$LSCOLORS" ]]; then
    export LSCOLORS='exfxcxdxbxGxDxabagacad'
  fi

  # Define colors for the completion system if they're not already defined
  if [[ -z "$LS_COLORS" ]]; then
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
  fi

  alias ls="${aliases[ls]:-ls} -G"
else
  alias ls="${aliases[ls]:-ls} -F"
fi

if (( $+commands[exa] )); then
	alias l='exa -1a'      # Lists in one column, hidden files.
	alias ll='exa -l'      # Lists human readable sizes.
	alias la='ll -a'       # Lists human readable sizes, hidden files.
	alias lr='ll -R'       # Lists human readable sizes, recursively.
	alias lt='ll -T'       # Lists recursively as a tree.
	alias sl='exa'         # I often screw this up.
else
	alias l='ls -1A'       # Lists in one column, hidden files.
	alias ll='ls -lh'      # Lists human readable sizes.
	alias la='ll -A'       # Lists human readable sizes, hidden files.
	alias lr='ll -R'       # Lists human readable sizes, recursively.
  alias lt='tree'        # Lists recursively as a tree.
	alias sl='ls'          # I often screw this up.
fi

# List all *.orig files in the current directory
alias lso='ll **/*.orig'

# Remove all *.orig files from the current directory
alias rmo='rm **/*.orig'
alias rmO='rm -rf **/*.orig'

# Grep
if zstyle -t ':akarzim:module:utility:grep' color; then
  export GREP_COLOR='37;45'           # BSD.
  export GREP_COLORS="mt=$GREP_COLOR" # GNU.

  alias grep="${aliases[grep]:-grep} --color=auto"
fi

# macOS Everywhere
if [[ "$OSTYPE" == darwin* ]]; then
  alias o='open'
else
  alias o='xdg-open'

  if (( $+commands[xclip] )); then
    alias pbcopy='xclip -selection clipboard -in'
    alias pbpaste='xclip -selection clipboard -out'
  elif (( $+commands[xsel] )); then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
  fi
fi

alias pbc='pbcopy'
alias pbp='pbpaste'

# File Download
if (( $+commands[curl] )); then
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
elif (( $+commands[wget] )); then
  alias get='wget --continue --progress=bar --timestamping'
fi

# Resource Usage
alias df='df -kh'

if (( $+commands[ncdu] )); then
  # The options are:
  # --color dark - use a colour scheme
  # -rr - read-only mode (prevents delete and spawn shell)
  # --exclude ignore directories I won't do anything about
  alias du='ncdu --color dark -rr -x --exclude .git --exclude node_modules'
else
  alias du='du -kh'
fi


# Edit README.md in Vim
if (( $+commands[vi] )); then
  alias vir="vi README.md"
  alias vic="vi CHANGELOG.md"
  alias vig="vi Gemfile"
  alias vid="vi config/database.yml"
fi

# Show README.md in terminal
if (( $+commands[bat] )); then
  alias catr='bat README.md'
  alias catc='bat CHANGELOG.md'
  alias catg='bat Gemfile'
  alias catd='bat config/database.yml'
else
  alias catr='cat README.md'
  alias catc='cat CHANGELOG.md'
  alias catg='cat Gemfile'
  alias catd='cat config/database.yml'
fi

# Open README.md in app
if (( $+commands[open] )); then
  alias or='open README.md'
  alias oc='open CHANGELOG.md'
fi

# Miscellaneous

# Serves a directory via HTTP.
if (( $+commands[python3] )); then
  alias http-serve='python3 -m http.server'
else
  alias http-serve='python -m SimpleHTTPServer'
fi

#
# Functions
#

# Makes a directory and changes to it.
function mkdcd {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# Changes to a directory and lists its contents.
function cdls {
  builtin cd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}
