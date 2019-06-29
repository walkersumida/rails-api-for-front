bundle install --path=vendor/bundle
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
[ -f /tmp/rails_api.pid ] && rm /tmp/rails_api.pid || echo "Not found"
bundle exec rails s -P /tmp/rails_api.pid -b '0.0.0.0'
