#
# Gustavo Paulo <gustavo.paulo.segura@gmail.com>
#
# zsh personalized configuration
#

export ZSH=/home/gpaulo00/.oh-my-zsh

DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"

# plugins and theme
plugins=(git systemadmin zsh-autosuggestions)
ZSH_THEME="powerlevel9k/powerlevel9k"

# powrlevel9k config
# fish-like path
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# general
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_STATUS_VERBOSE="false"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rvm pyenv)
POWERLEVEL9K_HOME_ICON=""

# rvm
POWERLEVEL9K_RVM_BACKGROUND="197"
POWERLEVEL9K_RVM_FOREGROUND="232"

# os icon
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="black"


# Oh My Zsh!
source $ZSH/oh-my-zsh.sh

### My config
alias zshconfig="${EDITOR} ~/.zshrc"
alias ohmyzsh="${EDITOR} ~/.oh-my-zsh"
