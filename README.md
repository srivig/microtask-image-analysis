# heroku-deck
A [Wagn](http://wagn.org) deck that can be installed on Heroku

## Setup

Ahoy, Wagneer! You are only three -oys away from your very own Wagn deck:

### Employ

You need to have a cloud storage provider at your disposal. Find and get one if you don't have one. For example
[AWS S3](https://aws.amazon.com/s3/), [Rackspace](https://www.rackspace.com) or [Google Cloud](https://cloud.google.com).

### Deploy

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/wagn/heroku-deck)

Wagn uses [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) and [Fog](https://github.com/fog/fog) 
to handle file uploads. The config variables in Heroku are translations of CarrierWave's Fog [configuration API](https://github.com/carrierwaveuploader/carrierwave#fog)

```ruby
config.fog_option = value    # => OPTION = value
config.fog_credentials = {
  option = value             # => CREDENTIALS_OPTION = value
}
```

Currently, Wagn supports only Google and AWS configuration via Heroku config variables. If you want to use a different cloud provider you have to fork this repository and adapt the `file_buckets` configuration in `config/application.rb`.

### Enjoy

The first page load takes a while and sometimes fails with an error message. 
In that case just reload the page and then have fun with your new Wagn deck.
