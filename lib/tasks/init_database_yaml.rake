namespace :init do
  task 'database_yaml' do
    unless File.exists?(File.join('config', 'database.yml'))
      cp(File.join('config', 'database.sample.yml'), 
         File.join('config', 'database.yml'), :verbose => true)
    end
  end
end

unless Rake::Task.task_defined?("init")
  desc "Initializes the rails environment for development"
  task :init do ; end
end

# Add namespaced tasks to default :init task
Rake::Task["init"].enhance ["init:database_yaml"]
