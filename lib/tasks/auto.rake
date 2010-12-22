namespace :auto do
  desc 'Runs autotest on cucumber and rspec tests'
  task :test do
    gem 'test-unit', '1.2.3' if RUBY_VERSION.to_f >= 1.9
    ENV['RSPEC'] = 'true'       # allows autotest to discover rspec
    ENV['AUTOTEST'] = 'true'    # allows autotest to run w/ color on linux
    ENV['AUTOFEATURE'] = 'true' # allows autotest to discover cucumber
    system((RUBY_PLATFORM =~ /mswin|mingw/ ? 'autotest.bat' : 'autotest'), *ARGV) ||
      $stderr.puts("Unable to find autotest.  Please install ZenTest or fix your PATH")
  end

  desc 'Runs autotest on only rspec tests'
  task :spec do
    gem 'test-unit', '1.2.3' if RUBY_VERSION.to_f >= 1.9
    ENV['RSPEC'] = 'true'       # allows autotest to discover rspec
    ENV['AUTOTEST'] = 'true'    # allows autotest to run w/ color on linux
    ENV['AUTOFEATURE'] = 'false' # allows autotest to discover cucumber
    system((RUBY_PLATFORM =~ /mswin|mingw/ ? 'autotest.bat' : 'autotest'), *ARGV) ||
      $stderr.puts("Unable to find autotest.  Please install ZenTest or fix your PATH")
  end

  desc 'Runs autotest on only cucumber tests'
  task :cucumber do
    gem 'test-unit', '1.2.3' if RUBY_VERSION.to_f >= 1.9
    ENV['RSPEC'] = 'false'       # allows autotest to discover rspec
    ENV['AUTOTEST'] = 'true'    # allows autotest to run w/ color on linux
    ENV['AUTOFEATURE'] = 'true' # allows autotest to discover cucumber
    system((RUBY_PLATFORM =~ /mswin|mingw/ ? 'autotest.bat' : 'autotest'), *ARGV) ||
      $stderr.puts("Unable to find autotest.  Please install ZenTest or fix your PATH")
  end

  desc 'Alias for auto:test'
  task :all => 'auto:test'
end

desc 'Autotest'
task :auto => 'auto:test'
