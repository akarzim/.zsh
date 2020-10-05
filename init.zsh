# Module Loader

# This module must be loaded first
source "${0:h}/.zsh/modules/environment.zsh"
source "${0:h}/.zsh/modules/directory.zsh"
source "${0:h}/.zsh/modules/editor.zsh"

source "${0:h}/.zsh/modules/git.zsh"

# This module must be loaded before the history-substring-search module
source "${0:h}/.zsh/modules/history.zsh"
source "${0:h}/.zsh/modules/osx.zsh"
source "${0:h}/.zsh/modules/ruby.zsh"
source "${0:h}/.zsh/modules/rails.zsh"

source "${0:h}/.zsh/modules/ssh.zsh"
source "${0:h}/.zsh/modules/history-substring-search.zsh"

source "${0:h}/.zsh/modules/helper.zsh"
source "${0:h}/.zsh/modules/spectrum.zsh"
source "${0:h}/.zsh/modules/utility.zsh"
source "${0:h}/.zsh/modules/completion.zsh"
source "${0:h}/.zsh/modules/nvm.zsh"

source "${0:h}/.zsh/modules/source.zsh"
