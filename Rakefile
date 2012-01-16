# encoding: UTF-8
require 'rubygems'
require 'rake'

begin
  include Rake::DSL
rescue NameError
end

task :default do
  Dir[File.expand_path("../bundle/*", __FILE__)].each do |bundle|
    Dir.chdir(bundle) do
      plugin = File.basename(bundle)
      if File.exist?(".git")
        unless File.read(".git/HEAD") =~ /ref/
          `git checkout master`
        end
        STDOUT.print "Updating #{plugin} "
        `git pull`
        puts "✓"
      else
        puts "Skipping #{plugin}"
      end
    end
  end
  puts "Please check if submodule changes have to be commited"
end
