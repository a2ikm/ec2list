# ec2list

Show running instances on AWS EC2.

## Installation

Add this line to your application's Gemfile:

    gem 'ec2list'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ec2list

## Setup ~/.aws/config

You need to setup ~/.aws/config. Instructions are [here](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html).

## Usage

With default profile, 

```
$ ec2list
```

With specific profile,

```
$ ec2list --profile PROFILE
```

## Contributing

1. Fork it ( http://github.com/a2ikm/ec2list/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
