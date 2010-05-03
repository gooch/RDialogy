# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.spec 'rdialogy' do
  developer('Ross Paine', 'paine@bur.st')

  # self.rubyforge_name = 'rdialogyx' # if different than 'rdialogy'
end

desc "Run all examples with RCov"
Spec::Rake::SpecTask.new('rcov') do |t|
  t.spec_files = FileList['spec/*.rb']
  t.rcov = true
  t.rcov_opts = ['--exclude', 'examples', '-p']
end

# vim: syntax=ruby
