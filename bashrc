
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

export LC_ALL="C.UTF-8"
#export PATH="$HOME/bin:$PATH:$HOME/.cargo/bin:/opt/nvim-linux64/bin:/home/marad/.local/share/nvim/rocks/bin"
#export RUSTC_WRAPPER=sccache
export CHI_HOME="$HOME/.chi"
export JAVA_HOME="/usr/lib/jvm/default"
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH="$CHI_HOME/bin:$HOME/.cargo/bin:/opt/nvim-linux64/bin:$PATH"

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


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export GRAALVM_HOME=$(sdk home java 22-graal)
