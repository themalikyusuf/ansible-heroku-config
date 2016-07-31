Feature: Configure Heroku App

	Scenario: Install Pip and Pexpect
		When I Install Pip and Pexpect
		Then it should be successful

	Scenario: Clone the project repository from Github
		When I clone the project repository from Github
		Then it should be successful
		And the project folder should exists
		And the folder should contain a git project

	Scenario: Login into Heroku
		When I login into Heroku
		Then it should be successful

	Scenario: Deploy app to Heroku
		When I deploy app to Heroku
		Then it should be successful
		And GET request to the app url should succeed

	Scenario: Configure environment variables
		When I configure environment variables
		Then it should be successful