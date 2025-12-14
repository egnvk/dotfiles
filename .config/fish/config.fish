# Autostart Sway on tty1
if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec sway
end

if not status is-interactive
    # Commands to run in interactive sessions can go here
    return 0
end

set --g -x fish_greeting ''
starship init fish | source

export EDITOR=nvim
# set -g fish_vi_key_bindings
set -g fish_key_bindings fish_vi_key_bindings

abbr -a nv nvim
abbr -a n nvim

# fnm
set FNM_PATH "/home/egn/.local/share/fnm"
if [ -d "$FNM_PATH" ]
  set PATH "$FNM_PATH" $PATH
  fnm env | source
end

set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH

# Только если pyenv уже установлен
if type -q pyenv
    pyenv init - | source
    pyenv virtualenv-init - | source
end

# Created by `pipx` on 2025-07-01 00:05:37
set PATH $PATH /home/egn/.local/bin

# source ~/.config/fish/tokyonight_moon.fish
