Translation Handler [![Gem Version](https://badge.fury.io/rb/translation_handler.svg)](http://badge.fury.io/rb/translation_handler)
===================

A MVC based Rails Engine(gem) that manages translations available from (config/locals/*.yml) through making customized views so that translation files can be managed easily from User Interface.

# How to install
Just include the gem inside your Gemfile

    gem "translation_handler", "~> 0.0.4
    
or direct from github master branch

    gem 'translation_handler', :git => 'git@github.com:bilashsaha/translation_handler.git'
    
Then run

    bundle install

Then restart your server and you are done! You can manage the translations from 

    http://localhost:3000/translation_handler/translations
    
Note: You dont need to restart your server after editing any existing translations but you must restart the server after adding a new locale


If you want to customize the translation views, you can generate it inside your application by running the following generator

    rails g translation_views generate
    
You will get the generated views at app/views/translation_handler/translations
