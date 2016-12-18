#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# export TERM="screen-256color"

# Docker prompt
# export PURE_PROMPT_SYMBOL='🐳 '
# export PURE_PROMPT_SYMBOL='鯨'
# export PURE_PROMPT_SYMBOL='🅳 ❯'
