require 'bundler/gem_tasks'

desc 'Build the client'
task :default do
  sh 'bundle exec heroics-generate ./config/config.rb > lib/liblynx-api/client.rb'
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: [:spec]
rescue LoadError
end
