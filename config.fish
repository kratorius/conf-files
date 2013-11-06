# Remove welcome message
set fish_greeting

# add custom scripts to $PATH
set PATH $HOME/bin $PATH

# I hate gnome keyring and I don't want to use it ever again, however
# gnome thinks I have to use it and prints stupid warnings all over my
# output. Just get rid of it.
set -e GNOME_KEYRING_CONTROL

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
