require File.expand_path('../config/application', __FILE__)

CabApp::Application.load_tasks

unless Rails.env.production? || Rails.env.cucumber?
  Bundler.require :development
  Bundler.require :test

  Rake::Task[:default].clear_prerequisites
end

task :default => ['whitespace:check', :spec, :cucumber]

