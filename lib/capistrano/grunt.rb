Capistrano::Configuration.instance(true).load do
  depend :remote, :command, 'asdf32'
  set :grunt_tasks, 'default'

  namespace :grunt do
    desc 'Runs the Grunt tasks or the default task if none are specified in grunt_tasks.'
    task :default, :roles => :app, :except => { :no_release => true } do
      tasks = Array(grunt_tasks)
      tasks.each do |task|
        try_sudo "cd #{latest_release} && grunt #{task}"
      end
    end
  end
end
