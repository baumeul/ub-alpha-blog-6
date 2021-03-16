# README

## Production Deploy - Text directions, references and code
You can sign-up for a heroku account at: https://www.heroku.com/

## Preparation for production deployment:

* Remove *sqlite3* gem from top of your Gemfile to within group *:development*, :*test* do block

	```ruby
	group :development, :test do
  	  gem 'sqlite3', '~> 1.4'
  	gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
	end
	```

* Create a group **production**

	```ruby
	group :production do
	  gem 'pg'
	end
	```

* Save Gemfile

* Run

	```bash
	$ bundle install --without production
	```

	to update **Gemfile.lock** file

	```bash
	$ bundle lock --add-platform x86_64-linux
	```
		
* Commit your changes to git repo

	```bash
	$ git add -A
	$ git commit -m "Make app production ready"
	```

* You can check if you already have Heroku CLI installed by going to your terminal and typing in
 
	`$ heroku --version` 
	
	or simply heroku.

* You can get the Heroku CLI from here: `https://devcenter.heroku.com/articles/heroku-cli`

* Check Heroku installation: 
`$ heroku --version`

* Once installed, login to your Heroku account from your application directory:
`$ heroku login`

* To create a new production version of your app hosted in Heroku, use the following command:
`$ heroku create`

* To push your application code to Heroku and deploy your app, use the command below, but make sure all your code changes are committed by checking git status first (following the steps in the beginning of this text lecture)
`$ git push heroku master`

* To change the name of your application
`$ heroku rename newnameforyourapp`
replace **newnameoforyourapp** above with the name you'd like to give your app

* Your app will then be accessible from the following browser URL
  `https://newnameofyourapp.herokuapp.com`