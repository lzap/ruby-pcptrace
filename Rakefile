require 'rubygems'
require "rake/extensiontask"
require 'rake/testtask'

spec = Gem::Specification.load('pcptrace.gemspec')
Rake::ExtensionTask.new('pcptrace', spec)

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.test_files = FileList['test/test_*.rb']
end

task :default => :compile
