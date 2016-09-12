source 'http://rubygems.org'
gem 'wagn', '~> 1.19'
gem 'pg'
gem 'rails_12factor'
gem 'fog'
gem 'fog-aws'

# remove with next wagn update (current is 1.19.2)
gem "carrierwave", git: "https://github.com/carrierwaveuploader/carrierwave",
    branch: "master"

gem "delayed_job_active_record"

Dir.glob('mod/**{,/*/**}/Gemfile').each do |gemfile|
  instance_eval File.read(gemfile)
end
