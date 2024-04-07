# Order Manager

Order Manager is a Ruby on Rails application for managing orders.

## Dependencies

- Ruby version: 3.2.2
- Rails version: 7.0.8.1
- SQLite3: ~ 1.4
- Puma: ~ 5.0
- Other gems specified in the Gemfile

## Installation

1. Clone the repository:

```bash
git clone https://github.com/rajuac/order_manager.git

#running dependencies
cd order_manager

check rvm list for ruby 3.2.2 if not install by running

rvm install 3.2.2 
rvm use 3.2.2
bundle install

#db configuration and running migrations
rails db:create
rails db:migrate

# The seed file extract data from the input files
rails db:seed

#To load the styles 
rake assets:precompile
#Finally start the server
rails s
