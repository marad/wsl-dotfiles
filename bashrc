

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

export PATH="$PATH:$HOME/.cargo/bin"
