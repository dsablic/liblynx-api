require 'bundler/gem_tasks'
require 'prmd/rake_tasks/combine'
require 'prmd/rake_tasks/verify'
require 'prmd/rake_tasks/doc'

namespace :schema do
  Prmd::RakeTasks::Combine.new do |t|
    t.options[:meta] = 'meta.json'
    t.paths << 'schemata'
    t.output_file = 'schema.json'
  end

  Prmd::RakeTasks::Verify.new do |t|
    t.files << 'schema.json'
  end

  Prmd::RakeTasks::Doc.new do |t|
    t.options[:settings] = 'config.json'
    t.files = { 'schema.json' => 'api.md' }
  end
end

desc 'Build the client'
task :client do
  sh 'bundle exec heroics-generate ./config/config.rb > lib/liblynx-api/client.rb'
end

task build: ['schema:combine', 'schema:verify', 'schema:doc', 'client']

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: [:spec]
rescue LoadError
end
