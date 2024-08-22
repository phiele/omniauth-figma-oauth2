<div align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Figma-logo.svg/400px-Figma-logo.svg.png" width="80">

# OmniAuth Figma
A Figma OAuth2 strategy for OmniAuth.

</div>

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-figma-oauth2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-figma-oauth2


## Usage

Register your application with Figma to receive your Client ID and Secret key: https://www.figma.com/developers/apps

This is an example that you might put into a Rails initializer at `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :figma, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
end
```

You can now access the OmniAuth Figma OAuth2 URL: `/auth/figma`.


## Auth Hash
Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  provider: 'figma',
  uid: '510245748683192988',
  info: {
    email: 'john@doe.com',
    name: 'John',
    image: 'https://s3-alpha.figma.com/static/user_j.png',
  },
  credentials: {
    access_token: '<TOKEN>',
    expires_in: '<EXPIRATION (in seconds)>',
    refresh_token: 'refresh_token'
  }
}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/phiele/omniauth-figma-oauth2.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
