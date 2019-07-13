# 8th Books Search Engine
Version 0.6

Written by Pam Nunez
Powered by Google Books API

8th Books is a simple web application that allows a user to search for information regarding books and links to the Google Books page for each result available. A user can enter a search query in a text box and search for titles matching that query, returning a list of results from the Google Books API. 

  - Application implemented in Ruby on Rails with some custom Javascript
  - No database connection or authentication required
  - Used the Flatly Bootstrap theme from [Bootswatch][bootswatch].

### Tech

8th Books uses the following software and resources to operate:

* [Ruby on Rails][ror5] - version 5.2.3
* [Ruby][ruby] - version 2.5.0p0
* [Redis][redis] - version 4.1.2
* [RSpec][rspec] - version 3.8.2
* [Capybara][capyb] - version 3.25.0
* [Bootswatch Rails][boots-rails] - Repository of Bootswatch themes converted into SCSS and importable directly into Rails.
* [Bootstrap 4][bootstrap] - UI boilerplate for modern web apps
* [Google Books API][gbooks] - API allowing for the querying of a massive collection of books/texts and their identifying information
* [Heroku][heroku] - Application hosting service
* [RSpec][rspec] - Ruby on Rails testing toolkit

This repository is publically available on [Github][repo].

### Installation

8th Books is accessible via web browser. To implement, make sure the above versions of Ruby and Rails are installed on the system. To run locally:

Clone the repository, install the dependencies and devDependencies and start the server.

```sh
$ cd eighth-books/
$ bundle install
$ rails server
```

### Docker
Coming soon!

### Deployment
The production version of the app is deployed on Heroku using Git. The Heroku Postgres and Heroku Redis add-ons are installed. The deployment is triggered by pushing the desired branch (I've been using master, however in the future I will use the dedicated deployment branch for deployment) to the heroku remote repository associated with my Heroku account. Heroku CLI must be configured with my credentials before deployment. Once there is a commit on the branch that is ready to be deployed, run the following commands to assign the heroku remote for deployment:

```sh
$ heroku git:remote -a eighthbooks
# set git remote heroku to https://git.heroku.com/eighthbooks
$ git push heroku master
# Gem bundling, server starting and deployment
```

This will automatically install the necessary gems, run the Rails and Redis servers, and serve the app to [https://eighthbooks.herokuapp.com][eighthbooks].
There is currently no continuous integration implemented, this is soon to come.

### Testing

While the app does not use a database, in order to run tests, a database needs to be migrated for the testing frameworks to run. 
```sh
# Generate rspec test scripts
bundle exec rails generate rspec:install
# Generate a db
bundle exec rake db:create:all db:migrate
# Run rspec tests
rspec spec/test_file_spec.rb
```
There are unit tests and an integration test implemented. The integration test is available in:
 - spec/integration/integration_spec.rb 

This test confirms the functionality from end to end.The unit tests are available in:
 - spec/controllers/searches_controller_spec.rb
 - spec/features/pagination_spec.rb
 - spec/routing/routing_spec.rb
In addition to manual running of tests, committing to the repository will run tests and prevent commits if tests don't fail. If you want to bypass this, you can run:
```sh
git commit --no-verify
```


### Todos

 - [x]  Make the results paginated and have more than the limited number of results be visible and accessible
 - [x] Implement current tests and add new ones to check for more edge cases and functionality
 - [x] Implement end-to-end test
 - [ ] Add more descriptive text to the site to make it more user friendly and clear
 - [x] Test for responsiveness in terms of media sizes, and confirm that styling is consistent across media/browsers
 - [ ] Implement a preview function that allows someone to view basic information about a book before clicking on that result to view the full information page. Ideally this would be done asynchonously and would appear on the same screen as the search results as an alert.
 - [ ] Add a dedicated error page for 400s/404s/etc (still using Rails defaults in prod)
 - [ ] Implement more robust user input cleanup including preventing code injection
 - [x] Address the security vulnerability reported by Github regarding the bootstrap-sass dependency
 - [x] Make the whole table row clickable instead of just the image.
 - [x] Add caching for searching
 - [x] Paginate results table
 - [x] Add pre-commit hook to stop commits if tests fail


### Author

Pamela Nunez, June 2019


[//]: #

   [bootswatch]: <https://bootswatch.com/flatly/>
   [bootstrap]: <https://getbootstrap.com/docs/4.3/getting-started/introduction/>
   [ror5]: <https://weblog.rubyonrails.org/2019/3/28/Rails-5-2-3-has-been-released/>
   [boots-rails]: <https://github.com/maxim/bootswatch-rails>
   [ruby]: <https://docs.ruby-lang.org/en/2.5.0/>
   [gbooks]: <https://developers.google.com/books/docs/overview>
   [rspec]: <https://rspec.info/>
   [heroku]: <http://heroku.com/home>
   [repo]: <https://github.com/pamnunez/eighth-books>
   [eighthbooks]: <https://eighthbooks.herokuapp.com>
   [redis]: <https://redis.io/>
   [capyb]: <https://teamcapybara.github.io/capybara/>
   [rspec]: <https://rspec.info/>
