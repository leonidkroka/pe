#!/bin/bash
set -e

rm -f /paper_scammer_docker/tmp/pids/server.pid

bundle exec rake db:create
bundle exec rake db:migrate

exec "$@"
