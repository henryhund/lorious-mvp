# APPLICATION INFORMATION

	## Ruby Version 2.0.0
	## Rails Version 4.0.0

	## Database - Postgres
	## Web Server - Unicorn
	## Background Processing - ( ? ) Undecided
	## Templating - Haml

	## File Uploads - Carrierwave
	## Payment Processing - Stripe

	## Testing - Rspec + Factory Girl

# STARTING THE APPLICATION

	* Create a database.yml file that corresponds to the template in config/example_database.yml
	* run the command: `rake db:migrate` to ensure any pending database migrations are ran

	* run the command: `rails generate figaro:install` to generate the application.yml file which stores the application environment variables.
		* A list of all the api keys that need to be set can be found in config/api_keys_template.yml

# RUNNING TETS

# APPLICATION SUMMARY
