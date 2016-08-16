namespace :load do
  desc 'Load Countries'
  task :countries do
    load "#{Rails.root}/db/default/countries.rb"
  end
end
