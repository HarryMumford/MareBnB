MareBnB - Nightmare accommodation at nightmare prices!

## A description of the high level description of the spec.
* Listing a new space
* Add a name and description of the space
* Request to hire a space

## User Stories
```
As a user
So I can make some money off an alleyway
I want to be able to list a space

As a user
So a lodger can view info about the listing
I want to add a name and description to a space

As a lodger
So I can have a place to stay
I would like to request to hire a space

As a lodger
So I can select a place to stay
I want to view a list of spaces

As a user
So I can interact with the website
I want to be able to register

As a user
So other people can't use my account
I want to log out

As a user
So I can continue my previous activity
I want to login
```

## Database setup

After running `gem install bundler` and then `bundle install` run the following commands to set up the databases

```
$ createdb MareBnB
$ createdb MareBnB-test
$ bundle exec rake db:migrate
$ bundle exec rake db:migrate RACK_ENV=test
```
