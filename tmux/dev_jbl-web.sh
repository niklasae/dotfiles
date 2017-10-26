#! /usr/bin/env bash

session_name=`basename "$0" .sh`  # https://stackoverflow.com/a/7820227/537598
path="~/Code/work/jbl-web"
# Start session with one code window split between source/vagrant/ipython
tmux new-session -d -s "$session_name" -n "code" "cd $path && vim README.md"
tmux split-window -v -p 20 "cd $path && vagrant up && vagrant ssh"
tmux split-window -h -p 50 # FIXME: "cd $path && ipython"
# Window for python libs
tmux new-window -n "libs" "cd ~/.virtualenvs/jbl-web/lib/python2.7/site-packages && vim django/__init__.py +NERDTreeFind"
# Window for todo-list
tmux new-window -n "todos" "cd ~/Development/todos && vim jobylon.today.TODO -c 'vsplit jobylon.week.TODO' -c 'vsplit jobylon.year.TODO'"
# Select first window
tmux select-window -t 1
tmux -2 attach-session -t "$session_name"
