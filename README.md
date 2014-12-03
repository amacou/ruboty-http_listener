# Ruboty::HttpListener

This is a plugin for Ruboty to add another interface on HTTP

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-http_listener', github: 'amacou/ruboty-http_listener'
```

And then execute:

    $ bundle

## Usage

#### say

do the command below

```
curl -G http://localhost:8877/say --data-urlencode to='#ruboty' --data-urlencode body='hello あまこう'
```

then

```
ruboty > hello あまこう
```
#### message

do the command below

```
curl http://localhost:8877/message --data-urlencode from='#ruboty' --data-urlencode body='ruboty some command'
```

then

```
ruboty > command result
```

#### change listening port

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
