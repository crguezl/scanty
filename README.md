# Scanty, a really small blog

## Overview

Scanty is blogging software.  

It is not a blogging engine, but it's small and easy to modify, so it could be
the starting point for your blog, too.

## Features

* Posts (shock!)
* Tags
* Markdown (via Maruku)
* Ruby code syntax highlighting (via Syntax)
* Atom feed
* Comments via Disqus
* Web framework = Sinatra
* ORM = Sequel

## Dependencies

        $ bundle install

## Setup

Edit `main.rb` and change the Blog config struct at the top to your liking.  For
security purposes, change the admin password and the admin cookie key and
value.  These last two can be set to any random value you like, just choose
something other than the default.

In your `/etc/hosts` file add a line like this one:

    127.0.0.1   localhost www.example.com

Then run the server:

        $ ruby main.rb

And visit: `http://www.example.com:4567`

Log in with the password you selected, then click `New Post`.  The rest should be
self-explanatory.

In production, you'll probably want to run `rake start` to start (and restart)
the server.  Change the value of `port` at the top of the `Rakefile` to run on a
different port.

## Database

The default is a SQLite file named `blog.db`.  To use something else, set
DATABASE_URL in your environment when running the app, i.e.:

            $ DATABASE_URL='mysql://localhost/myblog' ruby main.rb

Or, modify the `Sequel.connect` statement at the top of `main.rb`.

The database will be created automatically when the server is executed.

## Comments

There are no comments by default.  If you wish to activate comments, create an
account and a website on [Disqus](disqus.com) and enter the website shortname as
the `:disqus_shortname` value in the Blog config struct.

## Import data

Christopher Swenson has a Wordpress importer: http://github.com/swenson/scanty_wordpress_import

Other kinds of data can be imported easily, take a look at the rake task `:import` for an example of loading from a YAML file with field names that match the database schema.

## Customize

There are no themes or settings beyond the basic ones in the Blog struct.  Just
edit the CSS or the code as you see fit.

## Meta

Written by Adam Wiggins. Forked to be used for teaching by Casiano Rodríguez León

Patches contributed by: Christopher Swenson, S. Brent Faulkner, and Stephen Eley

Released under the MIT License: http://www.opensource.org/licenses/mit-license.php

Forked from http://github.com/adamwiggins/scanty

http://about.adamwiggins.com/

