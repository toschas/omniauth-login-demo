# omniauth-login-demo

A rails app demonstrating omniauth usage, which can easily be deployed to Heroku.

## Setup

Go to https://console.developers.google.com, create a new app, and enable the following APIs:

- Contacts API

- Google+ API

Go to Credentials and create a new Client ID, taking note of the CLIENT_ID and CLIENT_SECRET values.
Make sure to set Redirect URIs and Javascript Origins correctly.

For example:


- Redirect URIs:	
https://warm-depths-6692.herokuapp.com/auth/google_oauth2/callback

- Javascript Origins:	
https://warm-depths-6692.herokuapp.com/

Change the server domain name with your Heroku server domain name.

## Running Locally

Make sure you have Ruby installed.  Also, install the [Heroku Toolbelt](https://toolbelt.heroku.com/).

```sh
$ git clone git@github.com:toschaslabs/omniauth-login-demo.git
$ cd omniauth-login-demo
$ bundle install
$ rake db:create db:migrate
```

Create application.yml from application.yml.example, change CLIENT_ID and CLIENT_SECRET with the ones from 
https://console.developers.google.com

```sh
$ foreman start web
````

Your app should now be running on [localhost:5000](http://localhost:5000/).
Because of the limitations for Redirect URIs and Javascript Origins Google Login isn't used when running the app locally,
instead a 'Development User' is used.

Running tests

```sh
$ rake tests
```

## Deploying to Heroku

```sh
$ heroku create
$ git push heroku master
$ figaro heroku:set -e production
$ heroku run rake db:migrate
$ heroku open
```
