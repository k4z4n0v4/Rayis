#
# ~/.bashrc
#

# Setting environment variables

export PATH=$HOME/.local/bin:$XDG_DATA_HOME/ghcup/.ghcup/bin:$PATH
export STACK_ROOT=$XDG_DATA_HOME/stack
export LIBVA_DRIVER_NAME=iHD
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export LESSHISTFILE="-"
export WEECHAT_HOME=$XDG_CONFIG_HOME/weechat
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export GHCUP_INSTALL_BASE_PREFIX=$XDG_DATA_HOME/ghcup
#export LIBGL_DRI3_DISABLE=1 
export TALPID_FIREWALL_DEBUG="1"
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS='-m --height 50% --border'
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ghci="clear && ghci -v0"
alias aura="sudo -E aura"
alias malnetsim="sudo inetsim --config $PWD/conf/inetsim.conf  --data-dir $PWD/data/ --report-dir $PWD/report --user suren"
PS1='[\u@\h \W]\$ '
source ~/.config/promptline.sh

# needed for adb autocomplete
function check_type() { type -t "$1"; }
update() {
    mullvad-exclude sudo -E aura -Syu
    mullvad-exclude sudo -E aura -Akuax
}
