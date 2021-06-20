# Setup Instructions

Things you may want to cover:

* Ruby version
  2.5

* System dependencies
  POSTGRES

* Configuration
  Make sure to set postgres password in database.yml

* Database creation
  rails db:create

* Database initialization
  rails db:migrate

# How to run the test suite
  ```ruby
  rspec
  ```

* Test Case Coverage
  Over 90 percent for Controllers and Models  []

  ![image](https://user-images.githubusercontent.com/48410696/122672335-86d84080-d1e4-11eb-94ba-c23d909de618.png)


# Run App
  ```ruby
  rails server
  ```

# API Documentation and Routes
  ### All routes for Backend
  ```ruby
  rake routes
  ```

  ### Postman Documentation for front end engineers
  https://documenter.getpostman.com/view/13310181/TzeZE6Tv

# A Look at Gemfile
  - devise for authorization
  - devise-jwt for API authorization and token revoking
  - simplecov for test case coverage
  - rspec-rails for Test Driven Development
  - whenever for cron jobs
  - Sidekiq for scheduling async
  - pry-rails for debugging
  - redis requirement for sidekiq
  - webmock for stubs
  - httparty for web requests


