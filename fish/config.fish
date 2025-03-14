# Fish Shell Configuration

# Prompt Customization
function fish_prompt
    set -l dir (prompt_pwd)
    set -l git_branch (git branch 2> /dev/null | sed -n '/\* /s///p')
    
    # Multiline prompt
    echo -n "╭─ "
    set_color white
    echo -n (whoami)
    set_color normal
    echo -n " at "
    set_color white
    echo -n "$dir"
    set_color normal
    
    if test -n "$git_branch"
        echo -n " git:($git_branch)"
    end
    
    echo ""
    echo -n "╰─ "
    set_color white
    echo -n "❯ "
    set_color normal
end

# System Info on Startup
function fish_greeting
    echo "Time: "(date +%H:%M)
    
    # Sway keyboard layout (adjust if needed)
    echo "Keyboard layout: "(swaymsg -t get_inputs | grep -m1 'xkb_active_layout_name' | awk -F '"' '{print $4}')
    
    # Battery (adjust path if different)
    if test -f /sys/class/power_supply/BAT1/capacity
        echo "Battery: "(cat /sys/class/power_supply/BAT1/capacity)"%"
    end
    
    echo "Memory usage: "(free -h | awk '/^Mem:/ {print $3 "/" $2}')
    echo "Uptime: "(uptime -p)
end

# Environment Variables
set -x TERM "xterm-256color"
set -x LC_ALL "en_GB.UTF-8"
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH $PATH $HOME/.spicetify

# Aliases
alias ls "ls --color"
alias logout "loginctl terminate-user winterofhell"
alias f "fastfetch"
alias n "nmcli device wifi connect my_wifi"
alias c "clear"
alias s "sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches"
alias t "nohup telegram-desktop > /dev/null 2>&1 &"
alias r "DRI_PRIME=1 gamemoderun flatpak run org.vinegarhq.Sober"
alias wow "rm /home/winterofhell/Documents/CircleL\ rus/DivxTac.dll"
alias update "sudo pacman -Syu"  # Changed to Arch/Pacman update
alias perf "sudo cpupower frequency-set -g performance"

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
export TERMINAL=alacritty
export COLUMNS=200
export XDG_SESSION_TYPE=wayland
export GDK_BACKEND=wayland
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
set -x LANG ru_RU.UTF-8
set -x LC_ALL ru_RU.UTF-8
set -Ux GTK_IM_MODULE fcitx5
set -Ux QT_IM_MODULE fcitx5
set -Ux XMODIFIERS @im=fcitx5
set -Ux INPUT_METHOD fcitx5
