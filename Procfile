web:    bundle exec thin start -p $PORT -e $RACK_ENV
worker: bundle exec rake jobs:work RAILS_ENV=$RACK_ENV