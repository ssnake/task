require "bundler/setup"
load "tasks/otr-activerecord.rake"

namespace :db do
  # Some db tasks require your app code to be loaded; they'll expect to find it here
  task :environment do
    require_relative "config/active_record"
  end
end