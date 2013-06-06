# capistrano-grunt

capistrano-grunt is a [Capistrano](https://github.com/capistrano/capistrano) extension that will let you run [Grunt](http://gruntjs.com/) tasks during your deploy process.

## Installation

1. Install the Gem

```bash
gem install capistrano-grunt
```

Or if you're using Bundler, add it to your `Gemfile`:

```ruby
gem 'capistrano-grunt', github: 'swalkinshaw/grunt'
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

If you don't set `grunt_tasks`, Grunt will run its default task (equivalent to just running `grunt` from the command line).

To run multiple tasks, use an array in the order you want them run:

```ruby
set :grunt_tasks, ['deploy:production', 'cdn']
```

The above would be equivalent of running the following from the command line:

```bash
grunt deploy:production
grunt cdn
```

Then add the task to your `deploy.rb`:

```ruby
after 'deploy:finalize_update', 'grunt'
```

### Tasks

* `grunt`: Runs the Grunt task(s) specified in the `grunt_tasks` variable.

### Configuration

* `grunt_tasks`: Grunt tasks to run. Use a string for a single task or an array for multiple ones. Defaults to `default`.
