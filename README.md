<div align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Figma-logo.svg/400px-Figma-logo.svg.png" width="80">

# OmniAuth Figma
A Figma OAuth2 strategy for OmniAuth.

</div>

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-figma-oauth2'
    gem 'omniauth-rails_csrf_protection'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-figma-oauth2


## Usage

Register your application with Figma to receive your Client ID and Secret key: https://www.figma.com/developers/apps

This is an example that you might put into a Rails initializer at `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :figma, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'],
    scope: 'file_content:read'
end
```

**Note:** You must specify the `scope` parameter with the permissions your app needs. Available scopes are documented in the [Figma REST API documentation](https://developers.figma.com/docs/rest-api/scopes/).

### Example with Multiple Scopes

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :figma, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'],
    scope: 'current_user:read file_comments:read file_content:read file_metadata:read file_versions:read projects:read'
end
```

You can now access the OmniAuth Figma OAuth2 URL: `/auth/figma`.

Make sure that all links to /auth/figma use POST requests. For example:
```ruby
link_to 'Sign in via Figma', '/auth/figma', method: :post
# or
button_to 'Sign in via Figma', '/auth/figma'
```

For more info check: https://github.com/omniauth/omniauth/wiki/Resolving-CVE-2015-9284


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
