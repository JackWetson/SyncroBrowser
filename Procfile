web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development} -b 0.0.0.0
worker: bundle exec sidekiq -t 25
