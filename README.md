# Disbursement manager

## Purpose
The operations manager is now asking you to make a system to calculate how much money should be disbursed to each merchant based on the following rules:

* Disbursements are done weekly on Monday.
* We disburse only orders which status is completed.
* The disbursed amount has the following fee per order:
    * 1% fee for amounts smaller than 50 €
    * 0.95% for amounts between 50€ - 300€
    * 0.85% for amounts over 300€
  
## Usage
`GET http://localhost:3000/dsb/index?start_date=2021_04_14`
`GET http://localhost:3000/dsb/index?merchant_id=1&start_date=2021_04_14`

The `merchant_id` is optional so if it missing all Disbursements will returned for the given period. 
The `start_date` is mandatory and needs to conform to `YYYY_MM_DD` format. Allowing for selection of any week starting from 
the start_date and subtracting 7 days. Another more flexible and extensible way to do it, is by supplying an `end_date` as well
so consumer of the endpoint could select any duration not just weeks. To make the avoid confusing days for months
we could either add the initial like M or D the in front of the number and then perform some regex magic or just pass a timestamp in seconds.

## Installation locally
You can install it locally by running the following commands in the terminal

make sure you have ruby 3.0.0, postgres and yarn installed

* `bundle install` to install the dependencies
* `rails db:setup` to create the databases
* `rails db:schema:load` to load the db schema and run the seeds will populate the tables with some dummy data
* `rails s` to start the server and head straight to http://localhost:3000 to view the app

The schema also exists on the /schema.xml and can be viewed by navigating to the url at the top of the file
You can repopulate the db with dummy data by using the rake tasks found /lib/tasks like so,
` bundle exec rake dsb:create_merchants` and you can also view all the tasks with `bundle exec rake -T` assuming they have a
description.

## Things missing
* The cron job or scheduler that runs and checks if it is time to trigger the worker. 
  For this i would use the [whenever](https://github.com/javan/whenever#example-schedulerb-file) gem 
  which allows to easily create, manage and keep under version control all your cron jobs.
* The background job that will create the Disbursements by calling `DsbCalculatorService#create_dsb` which could
  in fact live in each own service and could also host the logic in the `DsbController#index` for parsing the date and the time range for the query.
* A way to prevent multiple disbursements created for the same order, for that i would add a `order_id` foreign key 
in the disbursements table and then check if there is a record for that merchant and for that order before creating the disbursement
