export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /home/nick/.zsh/completion.zsh

# Initialize the completion system
autoload -Uz compinit

# Cache completion if nothing changed - faster startup time
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Enhanced form of menu completion called `menu selection'
zmodload -i zsh/complist

# Load NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Load Rust
source $HOME/.cargo/env

PS1=$
PROMPT_COMMAND=
echo -ne "\033]0;\a"

source /home/nick/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
alias ls='ls -G'
alias be='bundle exec'
source /home/nick/.zsh/key-bindings.zsh
source /home/nick/.zsh/aliases.zsh
[[ -s /home/nick/.autojump/etc/profile.d/autojump.sh ]] && source /home/nick/.autojump/etc/profile.d/autojump.sh
cd
clear
