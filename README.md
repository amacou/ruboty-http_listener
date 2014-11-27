# Ruboty::HttpListener

This is a plugin for Ruboty to add another interface on HTTP

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-http_listener', github: amacou/ruboty-http_listener
```

And then execute:

    $ bundle

## Usage

If you wanna talk to you by ruboty

do the command below

```
curl -G http://localhost:8877/ --data to='amacou' --data-urlencode body='hello あまこう' --data-urlencode from='#ruboty'
```

then

```
ruboty > hello あまこう
```

If you wanna change listening port to 3000,

You shoud add below to .env

```
LISTEN_PORT='3000'
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/ruboty-http_listener/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request