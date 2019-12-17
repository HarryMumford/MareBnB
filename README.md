# MareBnB
Nightmare accommodation at nightmare prices!

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
*To be completed...*
```
As a user
So I can name my price
I want to add a price per night to my space

As a user
So I can choose when people come
I want to show the available dates
```

## Database setup

After running `gem install bundler` and then `bundle install` run the following commands to set up the databases

```
$ createdb MareBnB
$ createdb MareBnB-test
$ bundle exec rake db:migrate
$ bundle exec rake db:migrate RACK_ENV=test
```

## MakersBnB specification

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

### Headline specifications

- ~~Any signed-up user can list a new space.~~
- ~~Users can list multiple spaces.~~
- ~~Users should be able to name their space, provide a short description of the space,~~ and a price per night. 
- Users should be able to offer a range of dates where their space is available.
- ~~Any signed-up user can request to hire any space~~ for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
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
