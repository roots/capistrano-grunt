desc <<-DESC
    Run Grunt tasks. By default, it runs with no task specified, which \
    means the default Grunt task will be run. The install command is \
    executed with the --no-color flag.

    You can override any of these defaults by setting the variables shown below.

      set :grunt_file, nil
      set :grunt_tasks, nil
      set :grunt_flags, '--no-color'
      set :grunt_target_path, nil
      set :grunt_roles, :all
DESC
task :grunt do
  on roles fetch(:grunt_roles) do
    within fetch(:grunt_target_path, release_path) do
      options = [
        fetch(:grunt_flags)
      ]

      options << "--gruntfile #{fetch(:grunt_file)}" if fetch(:grunt_file)
      options << fetch(:grunt_tasks) if fetch(:grunt_tasks)

      execute :grunt, options
    end
  end
end

namespace :grunt do
  task default: :grunt
end

namespace :load do
  task :defaults do
    set :grunt_file, nil
    set :grunt_tasks, nil
    set :grunt_flags, '--no-color'
    set :grunt_roles, :all
  end
end
