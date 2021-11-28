Demo Task App
=============

This demo app for the test task.

It implements business logic described in [here](https://gist.github.com/stevermeister/ae24e05a8f312e8a779bf3110a290e3d)

Before start make sure that your system has `sqlite3` installed

## Getting Started
```bash
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

## Test

```
rspec
```

## Start app

```
bundle exec rackup
```

Got to http://localhost:9292 you should see Swagger-UI