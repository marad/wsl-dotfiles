
# Configure https://github.com/marad/jumper
jumpLocation() {
    if [ -z "$@" ]; then
        selected=$(jumper list | fzf --ansi | awk -F'|' '{gsub(/^\s+/, "", $2); print $2}')
        cd $selected
    else
        selected=$(jumper get $@)
        cd $selected
    fi
}
alias jg="jumpLocation"
alias ls="eza --icons --git"
alias ll="eza --icons --git -lah"
alias grep="rg"
alias cat="bat"
alias iju="intellij-idea-ultimate"
alias ijc="intellij-idea-community"

# Linux version of macOS pbcopy and pbpaste
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# Ssh agent
alias ssha='eval $(ssh-agent) && ssh-add'

export LC_ALL="C.UTF-8"
#export PATH="$HOME/bin:$PATH:$HOME/.cargo/bin:/opt/nvim-linux64/bin:/home/marad/.local/share/nvim/rocks/bin"
#export RUSTC_WRAPPER=sccache
export CHI_HOME="$HOME/apps/chi"
export JAVA_HOME="/usr/lib/jvm/default"
export GRAALVM_HOME="/home/marad/.sdkman/candidates/java/22-graal"
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH="$HOME/bin:$CHI_HOME/bin:$HOME/.cargo/bin:/opt/nvim-linux64/bin:$PATH"

if [ -f "~/.display" ]; then
    source ~/.display
fi

#source ~/.bash_profile

eval "$(starship init bash)"

# Created by `pipx` on 2024-03-21 19:27:30
export PATH="$PATH:/home/marad/.local/bin"
export EDITOR=nvim
#export XDG_DATA_HOME="~/.local/share"
#export XDG_CONFIG_HOME="~/.config"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

