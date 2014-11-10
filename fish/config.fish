# Remove welcome message
set fish_greeting

# add custom scripts to $PATH
set PATH $HOME/bin $HOME/.local/bin $PATH

# disable gnome keyring
set -e GNOME_KEYRING_CONTROL

# Go
set GOPATH /home/ivan/go
set PATH /usr/local/go/bin $PATH

# add play to the path
set PATH $HOME/.system/play $PATH

# add depot_tools to the path
set PATH $HOME/development/depot_tools $PATH

# enable the the new fish pager (which will be enabled by default before long)
set fish_new_pager 1

function prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
  printf '%s:' (hostname|cut -d . -f 1)
  if test "$PWD" != "$HOME"
    printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
  else
    echo '~'
  end
  set_color normal
end

function fish_prompt
  if set -q VIRTUAL_ENV
    echo -n -s (set_color purple) "@" (basename "$VIRTUAL_ENV") " "
    set_color normal
  end

  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set color normal

  echo -n (__fish_git_prompt)
  set_color normal

  echo '$ '
end

# VirtualFish
set -g VIRTUALFISH_COMPAT_ALIASES # uncomment for virtualenvwrapper-style commands
. $HOME/development/virtualfish/virtual.fish
# optional plugins
. $HOME/development/virtualfish/auto_activation.fish
. $HOME/development/virtualfish/global_requirements.fish
. $HOME/development/virtualfish/projects.fish

# Termcap colors
set -x LESS_TERMCAP_mb (printf "\e[01;31m")
set -x LESS_TERMCAP_md (printf "\e[01;31m")
set -x LESS_TERMCAP_me (printf "\e[0m")
set -x LESS_TERMCAP_se (printf "\e[0m")
set -x LESS_TERMCAP_so (printf "\e[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\e[0m")
set -x LESS_TERMCAP_us (printf "\e[01;32m")
