# https://superuser.com/questions/292652/change-iterm2-window-and-tab-titles-in-zsh
# $1 = type; 0 - both, 1 - tab, 2 - title
# echo -en "\e[0;message\a "

set_window_title(){ echo -en "\e]2;$1\a" }
set_tab_title() { echo -en "\e]1;$1\a" }
set_window_and_tab_title(){ echo -en "\e]0;$1\a" }

# set_window_title_precmd() {
#   
#   if [[ $PWD =~ $HOME/Projects/* ]];
#   then
#     title="$(basename $PWD)"
#     set_window_and_tab_title "$title"
#     return
#   fi
#
#   local title="$PWD"
#   [[ $PWD =~ $HOME/* && $PWD != "$HOME" ]] && title="~/${PWD#"$HOME/"}"
#   set_window_and_tab_title "$title"
# }
#
# set_window_title_preexec(){
#     local title="FOOOOOOOOO $PWD"
#     [[ $PWD =~ $HOME/* && $PWD != "$HOME" ]] && title="~/${PWD#"$HOME/"}"
#     set_window_and_tab_title "$title"
# }
#
# autoload -U add-zsh-hook
# add-zsh-hook precmd set_window_title_precmd
# # add-zsh-hook preexec set_window_title_preexec 
#
