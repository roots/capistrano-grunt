# Capistrano::Grunt

This gem will let you run [Grunt](http://gruntjs.com/) tasks with Capistrano 3.x.

## Installation

Add this line to your application's Gemfile:

```bash
gem 'capistrano', '~> 3.1'
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

### npm

You'll most likely want to use this gem along with [capistrano-npm](https://github.com/capistrano/npm) as you may need to run `npm install` first on every deploy. See its README for configuration options.

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
before 'deploy:updated', 'grunt'
```

## Configuration

To specify a `Gruntfile`, use the `:grunt_file` option:

```ruby
set :grunt_file, -> { release_path.join('config/Gruntfile.js') }
```

To specify a `grunt` bin location, use the `:grunt_bin` option:

```ruby
set :grunt_bin, -> { release_path.join('node_modules/grunt-cli/bin/grunt') }
```

Configurable options:

```ruby
set :grunt_bin, :grunt                                     # default
set :grunt_file, nil                                       # default
set :grunt_tasks, nil                                      # default
set :grunt_flags, '--no-color'                             # default
set :grunt_roles, :all                                     # default
set :grunt_target_path, -> { release_path.join('subdir') } # default not set
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
