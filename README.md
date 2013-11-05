# Capistrano::Grunt

This gem will let you run [Grunt](http://gruntjs.com/) tasks with Capistrano 3.x.

## Installation

Add this line to your application's Gemfile:

```bash
gem 'capistrano', '~> 3.0'
gem 'capistrano-grunt', github: 'roots/capistrano-grunt'
```

And then execute:

```
$ bundle install
```

2. Add to `Capfile` or `config/deploy.rb`:

```ruby
require 'capistrano/grunt'
```

## Usage

Set what Grunt tasks you want run in your `deploy.rb` file:

```ruby
set :grunt_tasks, 'deploy:production'
```

If you don't set `:grunt_tasks`, Grunt will run without any task specified. (equivalent to just running `grunt` from the command line).

To run multiple tasks (can be string or array of strings):

```ruby
set :grunt_tasks, 'deploy:production cdn'
set :grunt_tasks, %w{deploy:production cdn}
```

The above would be equivalent of running the following from the command line:

```bash
grunt deploy:production cdn
```

Then add the task to your `deploy.rb`:

```ruby
before :updated, 'grunt'
```

## Configuration

### Gruntfile

To specify a `Gruntfile`, use the `:grunt_file` option:

```ruby
set :grunt_file, -> { release_path.join('config/Gruntfile.js') }
```

Other configurable options are shown here with the defaults:

```ruby
set :grunt_flags, '--no-color'
set :grunt_roles, :all
```

### Bundler

As some Grunt plugins (`grunt-contrib-compass`, `grunt-contrib-sass`) use Ruby, the `grunt` command is executed as `bundle exec grunt` when the `capistrano-bundler` gem is included.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
