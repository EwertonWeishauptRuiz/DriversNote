# README

This README contains the steps are necessary to get the
application up and running.

* Ruby version
  - Ruby 2.5.1p57
  - Rails 5.2.2

# Configuration

* Database initialization
  - Add a valid username and password in the file *database.yml* inside the **default method**
  - Example:
        ```ruby
        default: &default
            adapter: postgresql
            encoding: unicode
            # For details on connection pooling, see Rails configuration guide
            # http://guides.rubyonrails.org/configuring.html#database-pooling
            pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
            host: localhost
            username: ewerton
            password: ewerton
        ```
* Database creation
  - **After** adding a valid username and password, initializate the database in the command line:
      1. rake db:create
      2. rake db:migrate

* Add Users from csv file
  - In order to read the csv file and add the users to the database run in the command line:
    - UserImporter.new("vendor/users.csv").call

* Deployment instructions
  - After the database is initialized and populate the database with the csv file, run in the command line:
    - rails s
    - user_id is the primark key of each of the user given by the csv file.
    - Open the browser and go to: https://localhost.3000/user_id

