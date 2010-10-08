require "rspec/core/rake_task"
require "./lib/marshaled_attributes/version"

RSpec::Core::RakeTask.new

begin
  require "jeweler"

  JEWEL = Jeweler::Tasks.new do |gem|
    gem.name = "marshaled_attributes"
    gem.version = MarshaledAttributes::Version::STRING
    gem.summary = "Save marshaled objects using ActiveRecord"
    gem.description = "Save marshaled objects using ActiveRecord"
    gem.authors = ["Nando Vieira"]
    gem.email = "fnando.vieira@gmail.com"
    gem.homepage = "http://github.com/fnando/marshaled_attributes"
    gem.has_rdoc = false
    gem.add_dependency "activerecord"
    gem.files = FileList["{Gemfile,Gemfile.lock,Rakefile,MIT-LICENSE,marshaled_attributes.gemspec,README.*}", "{lib,spec,templates}/**/*"]
  end

  Jeweler::GemcutterTasks.new
rescue LoadError => e
  puts "You don't Jeweler installed, so you won't be able to build gems."
end
