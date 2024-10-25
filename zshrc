# Pure Prompt Installation
fpath+="$HOME/.zsh/pure"
autoload -U promptinit; promptinit
export TERM=xterm-kitty

# Customize Pure Prompt (show username, folder, arrows)
#RPROMPT="%F{yellow}$(git_prompt_info)%f"
PROMPT='╭─ %F{white}%n%f at %F{white}%~%f
%F{white}╰─%f '  # Replace ❯❯❯ with any arrow symbol

# System Info at startup
echo "Time: $(date +%H:%M)"
echo "Keyboard layout: $(swaymsg -t get_inputs | grep -m1 'xkb_active_layout_name' | awk -F '\"' '{print $4}')"
echo "Battery: $(cat /sys/class/power_supply/BAT1/capacity)%"
echo "Memory usage: $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
echo "Uptime: $(uptime -p)"

# Aliases and environment variables
export TERM="xterm-256color"
export LC_ALL="en_GB.UTF-8"
export PATH="$HOME/.cargo/bin:$PATH"

alias ls="ls --color"
alias logout="loginctl terminate-user winterofhell"
alias f="fastfetch"
alias n="nmcli device wifi connect my_wifi"
alias c="clear"
alias s="sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches"
alias t="telegram-desktop"
alias r="DRI_PRIME=1 gamemoderun flatpak run org.vinegarhq.Sober"
alias wow="rm /home/winterofhell/PortProton/data/prefixes/DEFAULT/drive_c/Program\ Files/Ascension\ Launcher/resources/client/DivxTac.dll"
alias update="sudo dnf upgrade --refresh"
export PATH=$PATH:/home/winterofhell/.spicetify
