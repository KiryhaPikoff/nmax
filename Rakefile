require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rake/extensiontask"

task :build => :compile

task :install => :build do
  system "gem install " + Nmax::NAME + "-" + Nmax::VERSION + ".gem"
end

task :clean do
  system "rm *.gem"
end

Rake::ExtensionTask.new("nmax") do |ext|
  ext.lib_dir = "lib/nmax"
end

task :default => [:clobber, :compile, :spec]
