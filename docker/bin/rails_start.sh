# bundle exec rake db:create
# bundle exec rake db:migrate
[ -f /tmp/rails_api.pid ] && rm /tmp/rails_api.pid || echo "Not found"
bundle exec rails s -P /tmp/rails_api.pid

