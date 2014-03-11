# disable fish greeting
set fish_greeting

# add ~/bin to local path
set PATH $HOME/bin $PATH $HOME/.local/bin

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
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set color normal

  echo -n (__fish_git_prompt)
  set_color normal
  echo '$ '
end
