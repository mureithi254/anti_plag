 ## Antiplagiarism App

 ===================================

 ### Prerequisities 

 * Git
 * Ruby v2.4.0
 * Rails 5.0.1

To use this app :

### Fork the Repository

Forking the project creates a copy of the code base 
which you can modify without affecting the main code 
base. Once you are okay with the changes you can make 
a Pull Request.

Now that you have a fork project, copy the URL for 
the Repo and clone the project using Git 

```
$ git clone https://github.com  <your-github-username> /anti_plag.git 

```
Lets now configure remote to point to the main project
repository in order to get latest updates

```
$ cd anti_plag
$ git remote add upstream https://github.com/mureithi254/anti_plag

```


### Make sure the following extra gems are installed on your local machine

First;

```
$ sudo apt-get update

```

```M
$ gem install nokogiri

```
then;

```
$ gem install httparty

```
lastly;

```
$ gem install pry

```

### Install the necessary gems needed to run the the app

```
$ bundle install --without production

```

### Update the Database 

```
$ bundle exec rails db:migrate

```

### Start the Server 

```
$ bundle exec rails s

```

### Contributing

We welcome everyone to contribute to our projects and help us tackle existing issues! To do so, there are a few things you need to know about the code. First, our code is divided in an MVC like structure, all available inside the app folder:

`app/models - Contains all our application and business logic`

`app/controllers - Contains everything that happens when requests come in and get dispatched`

This project is licensed under the **_MIT license._**


Regards


