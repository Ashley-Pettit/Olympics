# Technical Challenge - Olympic API

#### What is this?

This is the response to a technical test to develop an api for a mock Olympic Games.

The task involves creating mock data via a seed.rb file and then making the data available via an API with JSON output.

This test is designed to show RESTful API design with standard CRUD functionality.

Where possible I've attempted to follow SOLID design principals.

### How To Run

```
1. Download this repository
2. Ensure you have ruby at least version 2.2.2 installed. (Ruby -v)
3. Navigate to the downloaded folder using a terminal
4. Run bundle install in the folder to install dependencies
5. To run tests 'bundle exec rspec spec'
6. Add the seed data 'rake db:seed'
7. To run the API 'Rails s'

I'm presently building a very simple front-end to consume the API.

```

### Design notes

```
1. The API is designed to follow RESTful standards. Routes should match RESTful design.
2. Ruby Faker is used to seed the database with mock Olympic Data
3. Where possible small isolated functions have been made available to attempt to demonstrate single responsibility design. E.g. (is_event_in_future?)
4. Rspec is used for testing

```

### Olympic Dashboard Problem

The goal of this challenge is to build a Ruby API which can be used to display results and upcoming events from the next Olympics.

The API should support a JavaScript application to:

- Display events which are coming up.
- View the sports that are currently in progress.
- Displays results from the previous games/races under the current sports.

Eg. Basketball -> USA are currently playing Australia, 1hr ago Brazil defeated China 89-76, 2hrs ago Russia defeated Japan 102-101. Next game is USA vs Spain in 4 hours.

Bonus points: Build a JavaScript application which calls the API which displays results and upcoming events.

Zip all your files together for submission
