#!/usr/bin/env bash
#
# Stop pomo, since it's not yet implemented...
#
kill -9 $(ps aux | awk '/bin\/pomo/ {print $2}') 2> /dev/null
sed 's/running: true/running: false/g' ~/.pomo > ~/.pomo_temp
mv ~/.pomo_temp ~/.pomo
echo '#[default]#[fg=green]00:00#[default]' > ~/.pomo_stat
tmux refresh-client -S -t $(tmux list-clients -F '#{client_tty}')
