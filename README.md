# Live Weather Update

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

### Install Ruby version
``ruby-3.1.2``

### Rails version
-  6.1.7

### Database
- postgresql

### Database creation for local development without docker
- make changes to the database.yml according to your local setup
```
rails db:create
rails db:migration
rails db:seed
```

## Start App
```
rails server
```

## How to run the test suite
```
bundle exec rspec spec
```

# For docker development setup

## First, build the app for development purposes
```
docker-compose build
```

## Create the database
```
docker-compose run web scripts/wait-for-it.sh db:5432 --  "rake db:create db:migrate"
```

## Run the app in development mode
```
docker-compose up
```

Now open ``http://localhost:3000`` and look at your Javascript console to see messages

## Entering the web container
```
docker-compose exec web bash
```
