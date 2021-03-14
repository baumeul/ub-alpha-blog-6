# README

## Production Deploy - Text directions, references and code
You can sign-up for a heroku account at: https://www.heroku.com/

## Preparation for production deployment:

1. Remove sqlite3 gem from top of your Gemfile to within group :development, :test do block

```ruby
group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
```

2. Create a group production

```ruby
group :production do
  gem 'pg'
end
```

3. Save Gemfile

4. Run 
  `$ bundle install --without production` 
  to update `Gemfile.lock` file
  `$ bundle lock --add-platform x86_64-linux`

5. Commit your changes to git repo
   ```bash
   $ git add -A
   $ git commit -m "Make app production ready"
   ```

6. You can check if you already have Heroku CLI installed by going to your terminal and typing in 
  `$ heroku --version` or simply heroku.

7. You can get the Heroku CLI from here: `https://devcenter.heroku.com/articles/heroku-cli`

8. Check Heroku installation: 
  `$ heroku --version`

9. Once installed, login to your Heroku account from your application directory:
  `$ heroku login`

10. To create a new production version of your app hosted in Heroku, use the following command:
  `$ heroku create`

11. To push your application code to Heroku and deploy your app, use the command below, but make sure all your code changes are committed by checking git status first (following the steps in the beginning of this text lecture)
  `$ git push heroku master`

12. To change the name of your application
  `$ heroku rename newnameofyourapp`
replace `newnameofyourapp` above with the name you'd like to give your app

13. Your app will then be accessible from the following browser URL
  `https://newnameofyourapp.herokuapp.com`

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
