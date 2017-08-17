# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: ruby 2.3.1p112 (2016-04-26 revision 54768)

* System dependencies:
  * Install RVM [https://rvm.io/], see RVM guide on how to install Ruby version 2.3.1p112
  * Install Postgresql, Version: psql (PostgreSQL) 9.6.2
  * Install Bundler Gem, Version: 1.12.5, `gem install bundle -v 1.12.5 --no-rdoc --no-ri`

* Configuration: refer `config/application.rb` & `config/environments/{development.rb, test.rb, production.rb}` for details
	
* Database creation
  * Development Database: the configuration assumes the default system user created by postgres installtion for postgres database as the default user, lets call it user `tony`, from the psql prompt issue the following commands
     *   `CREATE SCHEMA bauji_dev AUTHORIZATION tony;`
  
* Database initialization
  * If you haven't already, run the following command from the root directory of your git clone
     * `bundle install`
  * To initialize the database run `bin/rails db:setup` from the git clone root

* How to run the test suite
   * Run all specs in spec directory (excluding plugin specs): `rake spec`
   * Run the code examples in spec/controllers: `rake spec:controllers`
   * Run the code examples in spec/helpers: `rake spec:helpers`
   * Run the code examples in spec/models: `rake spec:models`
   * Run the code examples in spec/requests: `rake spec:requests`
   * Run the code examples in spec/routing: `rake spec:routing`
   * Run the code examples in spec/views: `rake spec:views`
   * Run a specific example: `rake spec SPEC=spec/requests/offers_spec.rb`
   * Run a specific test method or context in an example: `rake spec SPEC=spec/requests/offers_spec.rb:48`
   * You can use `bundle exec rake` instead of just rake or the much easier `bin/rails` for all of the above commands too

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
