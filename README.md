# Debt Tracker
This project started as a study case to acquire more knowledge about Ruby on Rails and overall programming. Debt Tracker helps you to <TODO: Improve project description>

This application will allow a user to create an account and save a list of creditors with balance information.
They can then sort these debts by highest balance or annual percentage rate to see how long it will take to pay off all debts.
They can also add additional payment, either one time or recurring to the "snowball". 

## Getting Started
### Dependencies
- Docker
### Starting the containers
- Run `docker-compose up -d api`
### Creating and initializing the database
- Run `docker-compose run --rm api rails db:setup`
### Running RSpec and Rubocop
TODO
