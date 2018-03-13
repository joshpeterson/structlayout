unless Rails.env.production?
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
  Rake::Task['rubocop'].invoke
end
