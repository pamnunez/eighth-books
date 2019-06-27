# 8th Books Search Engine
Version 0.5

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
* [Bootswatch Rails][boots-rails] - Repository of Bootswatch themes converted into SCSS and importable directly into Rails.
* [Bootstrap 4][bootstrap] - UI boilerplate for modern web apps
* [Google Books API][gbooks] - API allowing for the querying of a massive collection of books/texts and their identifying information
* [Heroku][heroku] - Application hosting service
* [RSpec][rspec] - Ruby on Rails testing toolkit

This repository is publically available on [Github][repo].

### Installation

8th Books is accessible via web browser. To implement, make sure the above versions of Ruby and Rails are installed on the system. To run locally:

Install the dependencies and devDependencies and start the server.

```sh
$ cd project-directory/
$ bundle install
$ rails server
```

### Docker
Coming soon!

### Todos

 - Make the results paginated and have more than the limited number of results be visible and accessible
 - Implement current tests and add new ones to check for more edge cases and functionality
 - Add more descriptive text to the site to make it more user friendly and clear
 - Test for responsiveness in terms of media sizes, and confirm that styling is consistent across media/browsers
 - Implement a preview function that allows someone to view basic information about a book before clicking on that result to view the full information page. Ideally this would be done asynchronously and would appear on the same screen as the search results as an alert.
 - Add a dedicated error page for 400s/404s/etc
 - Implement more robust user input cleanup including preventing code injection
 - Address the security vulnerability reported by Github regarding the bootstrap-sass dependency

### Author

Pamela Nunez, June 2019


[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [bootswatch]: <https://bootswatch.com/flatly/>
   [bootstrap]: <https://getbootstrap.com/docs/4.3/getting-started/introduction/>
   [ror5]: <https://weblog.rubyonrails.org/2019/3/28/Rails-5-2-3-has-been-released/>
   [boots-rails]: <https://github.com/maxim/bootswatch-rails>
   [ruby]: <https://docs.ruby-lang.org/en/2.5.0/>
   [gbooks]: <https://developers.google.com/books/docs/overview>
   [rspec]: <https://rspec.info/>
   [heroku]: <http://heroku.com/home>
   [repo]: <https://github.com/pamnunez/eighth-books>
