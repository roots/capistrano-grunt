Capistrano::Configuration.instance(true).load do
  set :grunt_tasks,   'default'
  set :grunt_options, nil

  depend :remote, :command, 'grunt'

  namespace :grunt do
    desc 'Runs the Grunt tasks or the default task if none are specified in grunt_tasks.'
    task :default, :roles => :app, :except => { :no_release => true } do
      tasks = Array(grunt_tasks)
      tasks.each do |task|
        try_sudo "cd #{latest_release} && grunt #{grunt_options} #{task}"
      end
    end
  end
end
