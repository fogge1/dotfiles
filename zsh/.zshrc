
# plugins
autoload -Uz colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '(%b)'

setopt PROMPT_SUBST
PROMPT='%F{cyan}%~ %F{yellow}${vcs_info_msg_0_}%f %F{green}$%f '

source ~/dotfiles/zsh/F-Sy-H/F-Sy-H.plugin.zsh
source ~/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=(~/dotfiles/zsh/plugins/zsh-completions/src $fpath)
export PATH="/usr/local/opt/node/bin:$PATH"
