#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# TTY
#

if [[ -z "$GPG_TTY" ]]; then
  export GPG_TTY='tty'
fi

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

alias vi='nvim'
export EDITOR=`which nvim`
export VISUAL=`which nvim`
export PAGER=`which less`

#
# Calendar
#

alias wcal='ncal -w | sed -E "2,8s/ $(date +%e)/$(tput setaf 12)&$(tput sgr0)/"'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='fr_FR.UTF-8'
fi

if [[ -z "$LC_COLLATE" ]]; then
  export LC_COLLATE='fr_FR'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

# Set the list of directories that Zsh searches for functions.
fpath=(
  "$HOME/.zfunctions"
  $fpath
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

#
# Dotfiles
#
if [[ -z "$AGEKEY" ]]; then
  export AGEKEY="$HOME/Documents/keys/age-key.txt"
  export AGEPUBKEY=$(awk '/public key/ {print $4}' $AGEKEY)
fi
