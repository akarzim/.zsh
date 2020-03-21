# Defines macOS aliases and functions.

# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Functions
#

# Displays the macOS download history.
function osx-ls-download-history {
	local db
	for db in ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV*; do
		if grep -q 'LSQuarantineEvent' < <(sqlite3 "$db" .tables); then
			sqlite3 "$db" 'SELECT LSQuarantineDataURLString FROM LSQuarantineEvent'
		fi
	done
}

# Deletes the macOS download history.
function osx-rm-download-history {
	local db
	for db in ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV*; do
		if grep -q 'LSQuarantineEvent' < <(sqlite3 "$db" .tables); then
			sqlite3 "$db" 'DELETE FROM LSQuarantineEvent; VACUUM'
		fi
	done
}

# Deletes .DS_Store and __MACOSX directories.
function osx-rm-dir-metadata {
	find "${@:-$PWD}" \( \
		-type f -name '.DS_Store' -o \
		-type d -name '__MACOSX' \
	\) -print0 | xargs -0 rm -rf
}


# Displays the current Finder.app directory.
function pfd {
	osascript 2> /dev/null <<EOF
		tell application "Finder"
			return POSIX path of (target of first window as text)
		end tell
EOF
}

# Displays the current Finder.app selection.
function pfs {
	osascript 2>&1 <<EOF
		tell application "Finder" to set the_selection to selection
		if the_selection is not {}
			repeat with an_item in the_selection
				log POSIX path of (an_item as text)
			end repeat
		end if
EOF
}

# Previews files in Quick Look.
function ql {
	if (( $# > 0 )); then
		qlmanage -p "$@" &> /dev/null
	fi
}

#
# Aliases
#

# Changes directory to the current Finder directory.
alias cdf='cd "$(pfd)"'

# Pushes directory to the current Finder directory.
alias pushdf='pushd "$(pfd)"'

# Alias OSX functions
alias lsdf='osx-ls-download-history'
alias rmdf='osx-rm-download-history'
alias rmdm='osx-rm-dir-metadata'
