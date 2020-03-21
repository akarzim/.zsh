# Module Loader

# This module must be loaded first
source "${0:h}/modules/environment.zsh"
source "${0:h}/modules/directory.zsh"
source "${0:h}/modules/editor.zsh"

source "${0:h}/modules/git.zsh"

# This module must be loaded before the history-substring-search module
source "${0:h}/modules/history.zsh"
source "${0:h}/modules/osx.zsh"
source "${0:h}/modules/ruby.zsh"
source "${0:h}/modules/rails.zsh"

source "${0:h}/modules/ssh.zsh"
source "${0:h}/modules/history-substring-search.zsh"

source "${0:h}/modules/helper.zsh"
source "${0:h}/modules/spectrum.zsh"
source "${0:h}/modules/utility.zsh"
