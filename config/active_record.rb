require "otr-activerecord"
OTR::ActiveRecord.configure_from_file! './db/database.yml'
OTR::ActiveRecord.establish_connection!