require "otr-activerecord"
OTR::ActiveRecord.configure_from_hash!(adapter: "sqlite3", database: "task.sqlite3", encoding: "utf8", pool: 10, timeout: 5000)
# OTR::ActiveRecord.configure_from_hash!(adapter: "postgresql", host: "localhost", database: "db", username: "user", password: "pass", encoding: "utf8", pool: 10, timeout: 5000)
