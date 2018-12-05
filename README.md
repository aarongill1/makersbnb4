Description
===========
Group project creating a clone of AirBnB.

MVP - A pre-populated list of available spaces which are available for hire,
which contains contact details of host as there are no user logins.


User Stories
============
```
As a user,
So that I can use the service,
I would like to create an account.

As a user,
So that I can list my space,
I would like to be able to list my space.

As a user,
So that I can list all of my spaces,
I would like to be able to list multiple spaces.

As a user,
So that others can get a clear idea of my space,
I would like to be able name my space, provide a short description, and price per night.

As a user,
So that I can get maximum use of my space,
I would like to be able to offer a range of dates when my space is available.

As a signed-up user,
So that I can stay in a listed space,
I would like to be able to request to hire any space for one night.

As a host,
So that I can agree to who stays in my space,
I would like to be able to approve a request to hire my space.

As a user,
When looking for a space to hire,
I would like to see only the dates that the space is available for.

As a user,
Until a booking request has been approved by the host,
I can make a booking request on that space.
```

Database Setup - first time use only
====================================
1. Navigate to project root directory.
2. In terminal run `bundle install` to install required gems.
3. Open psql and type `CREATE DATABASE makersbnb;` followed by `CREATE DATABASE makersbnb_test;`.
4. In terminal run: `ruby setup.rb` to create the databases.
5. In terminal run: `ruby dm.rb` to create the tables for the live database only.
6. Open dm.rb in any editor - add to the top before the if statement `ENV['ENVIRONMENT'] = 'test'`.
7. In terminal run `ruby dm.rb` a second time to create tables for the production database.
8. Reverse step 6 so that original code is back in place.
