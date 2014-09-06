LibreConf
========

Ruby on Rails application created to manage conferences stuff like speakers, sponsors, talks, etc.

This app was created for the FOSS4G Buenos Aires 2013.

To setup the application locally
--------------------------------

0. Install dependencies. On ubuntu you need the following packages:

        sudo apt-get update
        sudo apt-get install git
        sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev
        sudo apt-get install postgresql postgresql-contrib libpq-dev 
        sudo apt-get install sqlite3 libsqlite3-dev
        sudo apt-get install nodejs

1. Install [RVM](https://rvm.io/)

2. Install Ruby 2.1.1

        rvm install 2.1.1

3. Clone the repo

        git clone https://github.com/maurimiranda/openconf.git

4. Go to the directory and the gemset should be create automatically

        rvm info

5. Install bundler

        gem install bundler

6. Install all other required gems
    
        bundle install

7. Create the db

        rake db:create

8. Run migrations
    
        rake db:migrate

9. Load test data

        rake db:data:load

	_Note: This will create a test user (email: test@test.com, password: test1234)_

10. Start the server
    
        rails server

11. Open the site in your browser

    [http://localhost:3000](http://localhost:3000)
