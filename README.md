[![Build Status](https://travis-ci.org/thecity/thecity-admin-ruby.svg?branch=master)](https://travis-ci.org/thecity/thecity-admin-ruby)
[![Coverage Status](https://coveralls.io/repos/thecity/thecity-admin-ruby/badge.png?branch=master)](https://coveralls.io/r/thecity/thecity-admin-ruby?branch=master)


##The City Admin API


This Ruby project is an API wrapper for TheCity Admin API (https://api.onthecity.org)


### Install / Setup

Installing the gem

```ruby
gem install the-city-admin
```


To add it to your Gemfile

```ruby
gem 'the-city-admin', :require => 'the_city_admin'
```


Add your church's City API Token and API Key to [RAILS_ROOT]/config/initializers/thecity_config.rb

```ruby
THECITY_KEY = '**** YOUR CITY API KEY ****'
THECITY_TOKEN = '**** YOUR CITY API TOKEN ****'
```


Next you will need to initialize a connection

```ruby
TheCity::AdminApi.connect(THECITY_KEY, THECITY_TOKEN)
```



### Example usage

Checkout the examples folder.


### Additional resources

* The City Admin API: https://github.com/thecity/thecity-admin-ruby
* The City developer community page: http://developer.onthecity.org


### License

This project is released under the MIT license (see LICENSE).

This project is maintained by Wes Hays (https://github.com/weshays) and Jason Hagglund (https://github.com/TheMetalCode).


### Contributors

Chris Morris: https://github.com/chrismo


### Want to Contribute?

If you would like to get involved in this project, then please fork the project. Make changes, add features, write some tests, and then send us a pull request.