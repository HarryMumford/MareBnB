# MareBnB
Nightmare accommodation at nightmare prices!

## A description of the high level description of the spec.
* Listing a new space
* Add a name and description of the space
* Request to hire a space

## The Team (big dawg and three puppies)

Here's the team that created this amazingly "stylistic" dynamic interactive website to share the glorious places to stay!

# The BIG DAWG

Big Al

![BigDawg](./images/alastair.jpg =100x100)
![Alastair](./images/alastairG.jpg)

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

As a user
So I can name my price
I want to add a price per night to my space

As a user
So I can choose when people come
I want to show the available dates
```
*To be completed...*
```
As a lodger
So I can confirm my stay
I would like to see if the landlord has approved my request

As a landlord
So I have a choice of who can stay
I would like to be able to approve requests

As a landlord
So I don't have to deal with pointless requests
I would like it so lodgers are unable to book unavailable dates

As a landlord
So I can choose from the requesters
I would like the space to be available until I approve the booking
```

## Setting up



## Database setup

After running `gem install bundler` and then `bundle install` run the following commands to set up the databases

```
$ createdb MareBnB
$ createdb MareBnB-test
$ bundle exec rake db:migrate
$ bundle exec rake db:migrate RACK_ENV=test
```

## Clone repository

Type this in the directory you would like to clone to

`git clone https://github.com/HarryMumford/MareBnB.git`

## Gems used

* activerecord - an Object Relation Mapping system that connects the objects of an application to tables in a relational database without writing SQL statements.
* bcrpyt -a password hashing function
* pg - ruby interface to the postgresql
* rake - a task runner, Ruby's official build automation tool
* sinatra - a dsl for creating web applications
* sinatra-activerecord - extends sinatra with extension methods and Rake tasks for dealing with an SQL database

### Testing gems

* capybara - web based test automation software
* rspec - behavioural driven framework
* rubocop - linter to ensure conventional ruby was written
* selenium-webdriver - drives a browser natively. A tool used to automate web application testing verifying that it works as expected.
* simplecov - a code coverage analysis tool
* simplecov-console - outputs the test coverage into console

## How to test

Run rspec in the terminal in the path 'MareBnB'

## MakersBnB specification

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

### Headline specifications

- ~~Any signed-up user can list a new space.~~
- ~~Users can list multiple spaces.~~
- ~~Users should be able to name their space, provide a short description of the space, and a price per night.~~
- ~~Users should be able to offer a range of dates where their space is available.~~
- ~~Any signed-up user can request to hire any space for one night,~~ and this should be approved by the user that owns that space.
- ~~Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

### Nice-to-haves

- Users should receive an email whenever one of the following happens:
 - They sign up
 - They create a space
 - They update a space
 - A user requests to book their space
 - They confirm a request
 - They request to book a space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
 - A user requests to book their space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

### Mockups

Mockups for MakersBnB are available [here](https://github.com/makersacademy/course/blob/master/makersbnb/makers_bnb_images/MakersBnB_mockups.pdf).


![Tracking pixel](https://githubanalytics.herokuapp.com/course/makersbnb/specification_and_mockups.md)

Our worst enemies the kittens!

![Alt Text](https://media.giphy.com/media/vFKqnCdLPNOKc/giphy.gif)
