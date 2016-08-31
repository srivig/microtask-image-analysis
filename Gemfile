source 'http://rubygems.org'
gem 'wagn', :git => 'https://github.com/xithan/wagn', branch: 'heroku'
gem 'pg'
gem 'rails_12factor'
gem 'fog'
gem 'fog-aws'
gem "carrierwave", git: "https://github.com/carrierwaveuploader/carrierwave",
    branch: "master"
gem "delayed_job_active_record"
Dir.glob('mod/**{,/*/**}/Gemfile').each do |gemfile|
  instance_eval File.read(gemfile)
end

# if $load_wagn
#   source 'http://rubygems.org'
#   gem 'wagn', :git => 'https://github.com/xithan/wagn', branch: 'heroku'
#   gem 'pg'
#   gem 'rails_12factor'
#   gem 'fog'
#   gem 'fog-aws'
# else
#   $load_wagn = true
#  # require "bundler"
#  # require "bundler/vendored_thor"
#   require "bundler/cli/install"
#   CLI::Install.new({}).run
#   #system "LOAD_WAGN=true bundle install"
#   card_path = Bundler.load.specs.find{|s| s.name == "card" }.full_gem_path
#   Dir.glob("#{card_path}/mod/**/Gemfile").each do |gemfile|
#     instance_eval File.read(gemfile)
#   end
#
#
# end

