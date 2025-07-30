if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
fzf --fish | source

set fish_greeting
set -x SHELL (command -v fish)
