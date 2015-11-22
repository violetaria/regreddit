
[![Build Status](https://travis-ci.org/violetaria/regreddit.svg?branch=documentation)](https://travis-ci.org/violetaria/regreddit)
 
# Regreddit

A remake of the famous reddit site.  Users can sign up, login, and post URLs to the site.  Used the following gems: Rails, ActiveRecord, Devise, Bullet, Kaminari, and Puma.  Experimented with Bootstrap CSS framework for styling.

## Usage

To run, start the server with `foreman start` to load required Environment Variables for Mandril integration or `rails s` for no email.

Note:  you must setup an .env file with the MANDRILL_API_KEY and MANDRILL_USERNAME values set to get the email integration to work.