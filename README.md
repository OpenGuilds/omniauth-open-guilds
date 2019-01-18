# Omniauth::Open::Guilds

This gem contains the OpenGuilds strategy for OmniAuth.

OpenGuilds offers a few different methods of
(integration)['https://docs.openguilds.com/#authentication'].
This strategy implements the browser variant of the "Sign in
with OpenGuilds" flow.

OpenGuilds uses OAuth 2.0. OpenGuilds's
[documentation]('https://docs.openguilds.com/#authentication') has sections
on how it implements this, so check that out if you are really interested
in the details.

## Before You Begin


You should have already installed OmniAuth into your app; 
if not, read the [OmniAuth README]('https://github.com/omniauth/omniauth') to get started.

Now sign in into your [OpenGuilds account area]('https://dashboard.openguilds.com/account')
 and create an application. Take note of your Application Key and Application Secret 
(not the Access Token and Access Token Secret) because that is what your 
web application will use to authenticate against the OpenGuilds API. 
Make sure to set a callback URL or else you may get authentication errors. 
(It doesn't matter what it is, just that it is set.)

## Using this Strategy

```ruby
gem 'omniauth-open-guilds'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-open-guilds


Next, tell OmniAuth about this provider. For a Rails app, your 
`config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "API_KEY", "API_SECRET"
end
```

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. 
Then, run `rake spec` to run the tests. You can also run `bin/console` 
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 
To release a new version, update the version number in `version.rb`, and then 
run `bundle exec rake release`, which will create a git tag for the version, 
push git commits and tags, and push the `.gem` file 
to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at 
https://github.com/open-guilds/omniauth-open-guilds.
