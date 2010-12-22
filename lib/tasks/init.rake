unless Rake::Task.task_defined?("init")
  desc "Initializes the rails environment for development"
  task :init do ; end
end

# Add namespaced tasks to default :init task
db_tasks = %w{ tmp:create db:schema:dump db:setup db:test:prepare }
Rake::Task["init"].enhance do
  db_tasks.each { |t| Rake::Task[t].invoke }
end
