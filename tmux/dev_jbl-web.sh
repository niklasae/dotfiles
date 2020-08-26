#! /usr/bin/env bash

session_name=`basename "$0" .sh`  # https://stackoverflow.com/a/7820227/537598
path="~/Code/work/jbl-web"
# Start session with one code window split between source/vagrant/ipython
tmux new-session -d -s "$session_name" -n "code" "cd $path && vim README.md"
tmux split-window -v -p 20  # "cd $path && echo 'here here!'" # FIXME: "cd $path && vagrant up && vagrant ssh"
tmux split-window -h -p 50  # "cd $path && echo 'here here!'" # FIXME: "cd $path && ipython"
# Window for python libs
tmux new-window -n "libs" "cd ~/.virtualenvs/jbl-web/lib/python2.7/site-packages && vim django/__init__.py +NERDTreeFind"
# Window for todo-list
tmux new-window -n "todos" "cd ~/Development/todos && vim jobylon.today.TODO -c 'vsplit jobylon.week.TODO' -c 'vsplit jobylon.year.TODO'"
# Window for scripts
tmux new-window -n "scripts" "cd ~/Development/emp && vim ad-form_source_kwargs.py +NERDTreeFind"
tmux split-window -v -p 50
# Window for jbl-web-tmp
tmux new-window -n "jbl-web-tmp" "cd ~/Code/tmp/jbl-web-tmp && vim README.md"
tmux split-window -v -p 20
# Window for jbl-serverless
#tmux new-window -n "jbl-web-tmp" "cd ~/Code/jbl-serverless && vim README.md"
tmux new-window -n "jbl-web-tmp" "cd ~/Code/jbl-serverless/glue && vim customer_analytics_etl.py +NERDTreeFind"
tmux split-window -v -p 20
# TMP
tmux new-window -n "Wiki" "cd ~/Code/work/jbl-web.wiki && vim Home.md +NERDTreeFind"
tmux new-window -n "Jane" "cd ~/Dropbox/work/jobylon && vim jane.txt -c 'split feature-table.md' -c 'vsplit dev-meeting.md' +NERDTreeFind"
# Select first window
tmux select-window -t 1
tmux -2 attach-session -t "$session_name"
