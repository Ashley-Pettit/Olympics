# Technical Test - Olympic Test

#### What is this?

This is the response to a technical test to develop an api for a mock Olympic Games.

The task involves creating mock data via a seed.rb file and then making the data
available via an API with JSON output.

Developed using Ruby 2.2.2

### How To Run

```
# Download this repository

# Ensure you have ruby at least version 2.2.2 installed. (Ruby -v)

# Navigate to the downloaded folder using a terminal

# Run bundle install in the folder to install dependencies

# To run tests
bundle exec rspec spec

# To run the application type 'rails s'. At localhost 3000 there is a basic
# front-end that consumes the ruby API.

# For learning and demonstration purposes I made an admin page with basic CRUD
# functionality to allow the user to create mock Olypmic data.

# This coding solution attempts to demonstrate SOLID design principals. That being
# said I am a junior developer :).

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
