# heroku-deck
A [Wagn](http://wagn.org) deck that can be installed on [Heroku](http://heroku.com)

## Setup

Ahoy, Wagneer! You are only three -oys away from your very own Wagn deck:

### Employ

For full functionality, you need to have a cloud storage provider at your disposal. Find and get one if you don't have one. For example
[AWS S3](https://aws.amazon.com/s3/), [Rackspace](https://www.rackspace.com) or [Google Cloud](https://cloud.google.com).

There is a possibility to use a Wagn deck without cloud storage. Choose "web" as file store option. In that case you won't be able to upload images and files and you can't make any css and javascript changes. But it's possible to embed images via urls (That's why the option is called "web". You can use existing "web" ressources in your deck)

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

The deploy form offers only credential config options for Google and AWS. If you want to use a different cloud provider then leave the credential fields empty, deploy the Heroku app, click on "manage app" and use the "config variables" section on the settings tab to provide the credentials for your cloud storage.

### Enjoy

The first page load takes a while and sometimes fails with an error message. 
In that case just reload the page and then have fun with your new Wagn deck.
