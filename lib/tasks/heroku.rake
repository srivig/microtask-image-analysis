namespace :heroku do
  desc "seed heroku deck"
  task :seed do
    Rake::Task["db:setup"].invoke
    #Rake::Task["wagn:bootstrap:load"].invoke
  end
end
