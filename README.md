LibreConf
========

Ruby on Rails application created to manage conferences stuff like speakers, sponsors, talks, etc.

This app was created for the FOSS4G Buenos Aires 2013.

To setup the application locally
--------------------------------

1. Install [RVM](https://rvm.io/)

2. Install Ruby 1.9.3

    `rvm install 1.9.3`

3. Clone the repo

    `git clone https://github.com/maurimiranda/openconf.git`

4. Go to the directory and the gemset should be create automatically

    `rvm info`

5. Install bundler

    `gem install bundler`

6. Install all other required gems
    
    `bundle install`

7. Create the db

    `rake db:create`

8. Run migrations

    `rake db:migrate`

9. Start the server
    
    `rails server`

10. Navegate the app

    [http://localhost:3000](http://localhost:3000)
