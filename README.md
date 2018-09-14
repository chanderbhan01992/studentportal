# STUDENT PORTAL - VNIT

INTRODUCTION
------------

VNIT Student Portal provides insight of the Jobs/Internships Interview experiences for On-Off Campus recruitements and the life at the campus of Vnit.


SETUP
-----

* First of all (if it's not) install python 2.7 in your machine.
```
$ brew install python #for UNIX
```
* You'll get the basic steps to install it on internet easily according to your configuration. (It's recommended to use LINUX/UNIX configurations, but you can find similar steps for windows also.)

* This is recommended to install pycharm ide to contribute in this project (https://www.jetbrains.com/pycharm/)

* After installing the ide, we need to install our project and its dependencies but before that it's a good practice to create virtual environment using ```virtualenv```
* ```virtualenv``` is a tool to create isolated Python environments. Refer it's documentation to know [more.](https://virtualenv.pypa.io/en/stable/ "more.")

INSTALL
--------
* Now Let's Install Virtualenv with pip
*There are other ways also to install virtualenv but I prefer this.*

```sh
$ easy_install pip
```
* Next step is to install the virtualenv package: 

```sh
$ pip install virtualenv
```

 Great you have installed ```virtualenv```on your machine.

* Create an Environment with virtualenv
Before creating the environment, let's seperate our project files. Let's create one directory.
```sh
$ mkdir mydirectory && cd mydirectory
```
 To create the environment with virtualenv:
```sh
$ virtualenv python portalenv  #see alternative if you are using other than LINUX/UNIX.
```
 After creating virtual environment, it's time to activate it. Type this command
```sh
$ source portalenv/bin/activate
```

 Now, we are all set to clone out project from github and open it on pycharm.

* Cloning the project

 Type this command in terminal to clone the repo.
```sh
$ git clone https://github.com/sagban/studentportal.git
```
 To check wether the cloning process done corectly type ``` ls```,and it'll look like this.
```sh
ls
portalenv stupo-task
``` 


   *Note: The directory 'mydirectory' is only to seperate the things from your stuff, so it won't effect out project because all the project stuff is in the repo we just cloned. So, don't try to rename it.*
  
  Since, we've just cloned our project it's time to open it in a super powerfull IDE pycharm
 * Now, open the project in pycharm.(directory stupo-task)
 * Setting up the interpreter for out project.
   In tab bar, go to File > Settings or Default Settings > Project Interpreter.
   now, create new local interpreter with using base interpreter python2.7 and existing environment that we created earlier "portalvenv".
    
    Now, open the terminal in pycharm itself and it must be looklike this
    ```sh
    (portalenv) SagBans-Mac:studentportal sagban$ 
    ```
    If it's not, then try to activate the virual environment from here by using the previous command 
    ```$ source ../portalenv/bin/activate    #be carefull of paths. This command is when you are in stupo-task repo```
    
    If everything worked fine >>
    Congratulations, you setup the StudentPortal project in your pc.
    
    


* Now it's a time to install the dependencies and devDependencies to start the development.

```sh
$ pip install -r requirements.txt
```

### Development

Installed? Great!
So, this should be your project structure
```sh
myproject/
  	studentportal/
            clubsapp/
            media/
            portalapp/
            resources/
            static/
            studentportal/
            templates/
            .etc.swp
            .gitignore
            db.sqlite3
            manage.py
            r.txt
            requirements.txt
     portalenv/
```

<h3 id="mysql">MySQL</h3>

<p>Now we have to setup the database for pur project which is MySQL, the following <code>apt</code> commands will get you the packages you need:</p>
<pre class="code-pre "><code langs="">sudo apt-get update
sudo apt-get install python-pip python-dev mysql-server libmysqlclient-dev
</code></pre>
<p>You will be asked to select and confirm a password for the administrative MySQL account.</p>

<p>After the installation, you can create the database directory structure by typing:</p>
<pre class="code-pre "><code langs="">sudo mysql_install_db
</code></pre>
<p>You can then run through a simple security script by running:</p>
<pre class="code-pre "><code langs="">sudo mysql_secure_installation
</code></pre>
<p>You'll be asked for the administrative password you set for MySQL during installation.  Afterwards, you'll be asked a series of questions.  Besides the first question which asks you to choose another administrative password, select yes for each question.</p>

<p>With the installation and initial database configuration out of the way, we can move on to create our database and database user.  Skip ahead to the next section.</p>


<div name="create-a-database-and-database-user" data-unique="create-a-database-and-database-user"></div><h2 id="create-a-database-and-database-user">Create a Database and Database User</h2>

<p>The remainder of this guide can be followed as-is regardless of whether you installed MySQL.</p>

<p>We can start by logging into an interactive session with our database software by typing the following (the command is the same regardless of which database software you are using):</p>
<pre class="code-pre "><code langs="">mysql -u root -p
</code></pre>
<p>You will be prompted for the administrative password you selected during installation.  Afterwards, you will be given a prompt.</p>

<p>First, we will create a database for our Django project.  Each project should have its own isolated database for security reasons.  We will call our database <code><span class="highlight">myproject</span></code> in this guide, but it's always better to select something more descriptive.  We'll set the default type for the database to UTF-8, which is what Django expects:</p>
The credentials you use while creating database should match with the DATABASES settings in the file `production.py`, Which kinda looks like this.
<pre class="code-pre "><code langs="">. . .

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.<span class="highlight">mysql</span>',
        'NAME': '<span class="highlight">myproject</span>',
        'USER': '<span class="highlight">myprojectuser</span>',
        'PASSWORD': '<span class="highlight">password</span>',
        'HOST': 'localhost',
        'PORT': '',
    }
}

. . .
</code></pre>

<pre class="code-pre "><code langs="">CREATE DATABASE <span class="highlight">myproject</span> CHARACTER SET UTF8;
</code></pre>
<p>Remember to end all commands at an SQL prompt with a semicolon.</p>

<p>Next, we will create a database user which we will use to connect to and interact with the database.  Set the password to something strong and secure:</p>
<pre class="code-pre "><code langs="">CREATE USER <span class="highlight">myprojectuser</span>@localhost IDENTIFIED BY '<span class="highlight">password</span>';
</code></pre>
<p>Now, all we need to do is give our database user access rights to the database we created:</p>
<pre class="code-pre "><code langs="">GRANT ALL PRIVILEGES ON <span class="highlight">myproject</span>.* TO <span class="highlight">myprojectuser</span>@localhost;
</code></pre>
<p>Flush the changes so that they will be available during the current session:</p>
<pre class="code-pre "><code langs="">FLUSH PRIVILEGES;
</code></pre>
<p>Exit the SQL prompt to get back to your regular shell session:</p>
<pre class="code-pre "><code langs="">exit
</code></pre>
<div name="migrate-the-database-and-test-your-project" data-unique="migrate-the-database-and-test-your-project"></div><h2 id="migrate-the-database-and-test-your-project">Migrate the Database and Test your Project</h2>

<p>Now that the Django settings are configured, we can migrate our data structures to our database and test out the server.</p>

<p>We can begin by creating and applying migrations to our database.  Since we don't have any actual data yet, this will simply set up the initial database structure:</p>
<pre class="code-pre "><code langs="">cd ~/<span class="highlight">studentportal</span>
python manage.py makemigrations
python manage.py migrate
</code></pre>
<p>After creating the database structure, we can create an administrative account by typing:</p>
<pre class="code-pre "><code langs="">python manage.py createsuperuser
</code></pre>
<p>You will be asked to select a username, provide an email address, and choose and confirm a password for the account.</p>

<p>Once you have an admin account set up, you can test that your database is performing correctly by starting up the Django development server:</p>
<pre class="code-pre "><code langs="">python manage.py runserver</code></pre>
<p>In your web browser, visit 127.0.0.1 <code>:8000</code></p>
<pre class="code-pre "><code langs="">http://<span class="highlight">127.0.0.1</span>:8000
</code></pre>


<p>When you're done investigating, you can stop the development server by hitting CTRL-C in your terminal window.</p>

*Don't forgot to activate virtual environment in every new terminal ( WE USE MANY THESE ;) ).*


### Guidelines for Managing code

* Everyone write and push code in your respective git branches.
* And then after you can create pull request of *branch* -> *master* from the github
* No one will push directly in master branch.
*Watch tutorials on git, github and version control to learn How to work with branches*
* Make sure scripts, templates, models, url related to the particular app you creates should in their respective folder. 

MAINTAINED BY
-------------
Team StudenPortal.(http://studentportal.vnit.ac.in/home/aboutus/)

Happy Coding!
