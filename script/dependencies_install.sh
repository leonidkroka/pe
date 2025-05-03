#!/bin/bash

sudo chown -R $USER /home/ubuntu/pe
cd /home/ubuntu/pe/
kill -9 $(cat /home/ubunta/pe/shared/pids/puma.pid)
kill -9 $(cat /home/ubunta/pe/tmp/pids/server.pid)

source ~/.bashrc
#gem install nokogiri -- use-system-libraries
#gem install bundler -- user-install
#bundle config build.nokogiri -- use-system-libraries
bundle install
