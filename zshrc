export TERM="xterm-256color"
export LC_ALL=en_GB.UTF-8
export PATH=~/.cargo/bin:$PATH

# echo "Time: $(date +%H:%M)"
echo "keyboard layout: $(swaymsg -t get_inputs | grep -m1 "xkb_active_layout_name" | awk -F '"' '{print $4}')"
echo "nattery: $(cat /sys/class/power_supply/BAT1/capacity)%"
echo "memory usage: $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
echo "uptime: $(uptime -p)"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir ...)
POWERLEVEL9K_USER_FOREGROUND='#ffffff'
POWERLEVEL9K_DIR_BACKGROUND='white'
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator vcs time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# ZPlug with optimizations
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/b4b4r07/zplug ~/.zplug
fi
source ~/.zplug/init.zsh

# Lazy loading
zplug "romkatv/powerlevel10k", as:theme
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2

# Optional deferred plugins
# zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Plugins needed for commands
zplug "plugins/git", from:oh-my-zsh, if:"[[ $commands[git] ]]"
zplug "plugins/kubectl", from:oh-my-zsh, if:"[[ $commands[kubectl] ]]"

zplug check || zplug install
zplug load

# Aliases
alias ls="ls --color"
alias logout="loginctl terminate-user toxblh"
alias f="fastfetch"
alias n="nmcli device wifi connect маша2013"
alias c="clear"
alias s="sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches"

# SDKMAN on demand
function sdk {
    export SDKMAN_DIR="/home/toxblh/.sdkman"
    [[ -s "/home/toxblh/.sdkman/bin/sdkman-init.sh" ]] && source "/home/toxblh/.sdkman/bin/sdkman-init.sh"
}
