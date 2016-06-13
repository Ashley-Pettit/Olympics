# Technical Challenge - Olympic API

#### What is this?

This is the response to a technical test to develop an api for a mock Olympic Games.

The task involves creating mock data via a seed.rb file and then making the data available via an API with JSON output.

This test is designed to show RESTful API design with standard CRUD functionality.

Where possible I've attempted to follow SOLID design principals. Please note I am a junior developer! This solution is by no means perfect.


### How To Run

```
1. Download this repository
2. Ensure you have ruby at least version 2.2.2 installed. (Ruby -v)
3. Navigate to the downloaded folder using a terminal
4. Run bundle install in the folder to install dependencies
5. Add the seed data 'rake db:seed'
6. To run the API 'Rails s'
7. Once the API is running a very basic front-end is available which merely shows the events available. This is a separate application yet is dependant on the API.

```

### Design notes

```
1. The API is designed to follow RESTful standards. Routes match RESTful design.
2. Params are whitelisted for security purposes
3. Verisioning is used to allow for updates to the API without causing linking applications to potentially fail.
4. Ruby Faker is used to seed the database with mock Olympic Data. This is done by 'Rake db:seed'
5. Where possible small isolated functions have been made available to attempt to demonstrate single responsibility design. E.g. (is_event_in_future?)
6. Rspec is used for testing.
7. An assumption is made that sports have a 1v1 nature E.g. Australia Vs. New Zealand. A model setup of country is available to demonstrate how the system could be developed to handle non 1v1 sports. E.g. Rowing.
8. As this is an API focused test the JavaScript application is very minimalist. It's provided to demonstrate how an application could be built with the API data.
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
