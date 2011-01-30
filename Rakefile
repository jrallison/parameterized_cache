require 'rspec/core'
require 'rspec/core/rake_task'

desc "Run API and Core specs"
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
  t.pattern = FileList['spec/**/*_spec.rb']
end

desc "Run all specs in spec directory with RCov"
RSpec::Core::RakeTask.new(:rcov) do |t|
  t.rspec_opts = ['--options', "\"#{File.dirname(__FILE__)}/spec/spec.opts\""]
  t.pattern = FileList['spec/**/*_spec.rb']
  t.rcov = true
  t.rcov_opts = lambda do
    IO.readlines(File.dirname(__FILE__) + "/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
  end
end

task :default => :spec