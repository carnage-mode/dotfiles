if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
fzf --fish | source
zoxide init fish | source

set fish_greeting
set -x SHELL (command -v fish)

bind ctrl-o fzf-file-widget
