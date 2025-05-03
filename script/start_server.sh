#!/bin/bash

cd /home/ubuntu/pe/
sudo rm /etc/nginx/sites-available/default
sudo mv nginx.conf /etc/nginx/sites-available/default
sudo ln -fns /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
sudo service nginx restart

export RAILS_ENV=production
rm config/credentials.yml.enc
#cp ../credentials.yml.enc config/
#cp ../master.key config/

RAILS_ENV=production bundle install
RAILS_ENV=production rake db:migrate
bundle exec rails server --deamon -u puma -e production -b unix:///tmp/pe.sock
#rails server --daemon -e production -b localhost -p 3000