# Configures Ruby local gem installation, loads version managers, and defines
# aliases.

# Load manually installed rbenv into the shell session.
if [[ -s "${RBENV_ROOT:=$HOME/.rbenv}/bin/rbenv" ]]; then
  path=("${RBENV_ROOT}/bin" $path)
  eval "$(rbenv init - --no-rehash zsh)"

# Load package manager installed rbenv into the shell session.
elif (( $+commands[rbenv] )); then
  eval "$(rbenv init - --no-rehash zsh)"

# Prepend local gems bin directories to PATH.
else
  path=($HOME/.gem/ruby/*/bin(N) $path)
fi

# Return if requirements are not found.
if (( ! $+commands[ruby] && !$+commands[rbenv] )); then
  return 1
fi

#
# Aliases
#

# General
alias rb='ruby'

# Bundler
if (( $+commands[bundle] )); then
  alias rbb='bundle'
  alias rbbc='bundle console'
  alias rbbd='bundle outdated'
  alias rbbe='bundle exec'
  alias rbbf='bundle config'
  alias rbbg='bundle gem'
  alias rbbh='bundle help'
  alias rbbi='bundle install'
  alias rbbk='bundle check'
  alias rbbl='bundle list'
  alias rbbm='bundle exec middleman'
  alias rbbn='bundle init'
  alias rbbo='bundle open'
  alias rbbp='bundle package'
  alias rbbr='bundle exec rubocop'
  alias rbbs='bundle show'
  alias rbbt='bundle platform'
  alias rbbu='bundle update'
  alias rbbU='bundle update --bundler'
  alias rbbv='bundle viz'
  alias rbbx='bundle clean'
  alias rbbX='bundle clean --force'
fi
