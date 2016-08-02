# ANSIBLE-HEROKU-CONFIG
This Ansible playbook:
- Clones a Node js application from Github
- Creates, Deploys and Scales the application on Heroku
- Configures a MongoDB Database and other environment variables

**Requirements**

- Before running this playbook, you must have Python >= 2.6 installed on your local machine. Head over [here](http://docs.python-guide.org/en/latest/starting/install/osx/) to install Python.
- An account on Heroku

**Clone The Project**
```
git clone https://github.com/andela-ayusuf/ansible-heroku-config.git
```

**Variables**

You will need to update the variables files i.e. **vars.yml** and **vars.rb** files with the appropriate variables. Currently there are only dummy variables in the variable files and this will not work.


**Running The Project**

From your terminal, enter into this project directory:

```
$ cd ansible-heroku-config
```
Run the playbook:
```
$ ansible-playbook playbook.heroku.yml
```
OR
```
$ cucumber features/config.feature
```
And with that done, we have an applications's infrastructure set up on AWS.

**Issues**

If you happen to run into any problems while using this playbook or you would like to make contributions to it, please endeavour to open an issue [here](https://github.com/andela-ayusuf/ansible-heroku-config/issues).

Best regards :)