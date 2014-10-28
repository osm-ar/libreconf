#Something like this could work as a vagrant provision script. Not tested

echo INSTALLING PACKAGES
sudo apt-get update
sudo apt-get --yes install git
sudo apt-get --yes install autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev
sudo apt-get --yes install postgresql postgresql-contrib libpq-dev 
sudo apt-get --yes install sqlite3 libsqlite3-dev
sudo apt-get --yes install nodejs

echo INSTALLING RBENV
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install 2.1.1

echo INSTALLING BUNDLE
gem install bundler

bundle install

bundle exec rake db:create RAILS_ENV=development
bundle exec rake db:migrate RAILS_ENV=development
