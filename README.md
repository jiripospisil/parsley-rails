# Parsley.js for Rails Asset Pipeline

[Parsley.js](https://github.com/guillaumepotier/Parsley.js) is an awesome form validation library ([documentation](http://parsleyjs.org/documentation.html)). 
This gem makes it easy to use it with Rails Asset Pipeline.

## Installation

Add this line to your application's Gemfile:

    gem "parsley-rails"

And then execute:

    $ bundle

## Usage

Add the following to your `app/assets/javascripts/application.js`:

    //= require jquery
    //= require parsley

To use the `extend` library, add this right after:

    //= require parsley.extend

Finally, if you want to use a different i18n:

    //= require parsley.i18n.fr

See the complete [Parsley.js documentation](http://parsleyjs.org/documentation.html).

## Versions

The gem follows Parsley.js's versions. If the gem version is `1.1.10.0`, then `1.1.10` is a version of Parsley.js and `0`
is a patch level of the gem itself.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
