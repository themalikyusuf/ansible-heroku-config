require "open3"
require_relative "vars"

# Scenario: Install Pip and Pexpect
When(/^I Install Pip and Pexpect$/) do
	cmd = "ansible-playbook playbook.heroku.yml --tags 'pip_pexpect'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

Then(/^it should be successful$/) do
	expect(@status.success?).to eq(true)
end

# Scenario: Clone the project repository from Github
When(/^I clone the project repository from Github$/) do
	cmd = "ansible-playbook playbook.heroku.yml --tags 'git_clone'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

And(/^the project folder should exists$/) do
	cmd = "ls #{HOMEPATH} | grep #{APPDIRNAME}"
	output, error, status = Open3.capture3 "#{cmd}"
	expect(status.success?).to eq(true)
  expect(output).to match("#{APPDIRNAME}")
end

And(/^the folder should contain a git project$/) do
	cmd = "ls -al #{HOMEPATH}/#{APPDIRNAME} | grep .git"
	output, error, status = Open3.capture3 "#{cmd}"
	expect(status.success?).to eq(true)
  expect(output).to match(".git")
end

# Scenario: Login into Heroku
When(/^I login into Heroku$/) do
	cmd = "ansible-playbook playbook.heroku.yml --tags 'heroku_login'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

# Scenario: Deploy app to Heroku
When(/^I deploy app to Heroku$/) do
	cmd = "ansible-playbook playbook.heroku.yml --tags 'heroku_deploy'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

And(/^GET request to the app url should succeed$/) do
	cmd = "curl -I http://#{APPNAME}.herokuapp.com"
	output, error, status = Open3.capture3 "#{cmd}"
	expect(status.success?).to eq(true)
  expect(output).to match("HTTP/1.1 200 OK")
end

# Scenario: Configure environment variables
When(/^I configure environment variables$/) do
	cmd = "ansible-playbook playbook.heroku.yml --tags 'vars_config'"
	output, error, @status = Open3.capture3 "#{cmd}"
end

