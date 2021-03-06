# Digital Ocean
{id: do-intro}


## Plan
{id: plan}

* Introduction to Digital Ocean
* Setup local environment for Web development and testing.
* Create a Digital Ocean Droplet = Virtual Private Server (VPS).
* Set up Python on the droplet.
* Set up Nginx web server on droplet. 


## What is Digital Ocean?
{id: what-is-digital-ocean}

* [Cloud Provider](https://www.digitalocean.com/?refcode=0d4cc75b3a74).
* Open Source supporter via the [Hacktoberfeest](https://hacktoberfest.digitalocean.com/)
* [Status](https://status.digitalocean.com/)


## Register on Digital Ocean
{id: register-on-digital-ocean}

* Register on [Digital Ocean](https://www.digitalocean.com/?refcode=0d4cc75b3a74) (get some credit)


## Local installations
{id: local-installations}

* Windows: Install [git-scm](https://git-scm.com/)
* Windows: [Python](https://www.python.org/) or [Anaconda](https://www.anaconda.com/distribution/)
* [PyCharm](https://www.jetbrains.com/pycharm/)


## Web Application Development Environment
{id: web-application-development-environment}

* Web application with templates, accepting parameters (echo), tests
* Project in GitHub: [Python Flask Demo](https://github.com/szabgab/python-flask-demo)
* Download as a zip file or clone locally
* Install the requirements locally
* Run the application locally

## Create ssh keypair
{id: create-ssh-keypair}

* Generate ssh keypair by running git-keygen

```
ssh-keygen.exe
```

```
ls -l ~/.ssh
```


## Create a Droplet
{id: create-a-droplet}

* 

* In order to add the ssh key to Digital Ocean run this:

```
cat ~/.ssh/id_rsa.pub
```
* And copy the content



## ssh to the Droplet
{id: ssh-to-the-droplet}

```
ssh root@IP
```

* Accept the ECDSA fingerprint by typing "yes"


```
upime
```


## Update packages
{id: update-packages}

```
apt-get update
apt-get dist-upgrade
reboot
```


## Install nginx
{id: install-nginx}


* Try to visit: http://IP

```
apt-get install nginx
```

* Try to visit: http://IP

* Edit /var/www/html/index.nginx-debian.html and see the changes are reflected on the web page.



## Install python3
{id: install-python3}


```
which python3
```

```
apt-get install python3
apt-get install virtualenv
```

## Create user to have the application
{id: create-user}

```
adduser --gecos '' --disabled-password  dev
```

## Add the application source code
{id: add-application-source-code}


Switch to the user:

```
su - dev
```

* By cloning:

```
git clone https://github.com/szabgab/python-flask-demo.git
cd python-flask-demo
virtualenv -p python3 venv3
```

* By upload using scp, run the command on your desktop:

```
scp -r README.md root@IP:
```

{aside}
This is just an example, you need to zip the files on your computer, scp the zip file and unzip in user dev.
{/aside}

## Configure nginx
{id: configure-ngin}

```
ls -l /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default
ln -s /home/dev/python-flask-demo/config/demo-nginx.conf /etc/nginx/sites-enabled/demo-nginx.conf
```

If there are problems you can take a look at this file:

```
/var/log/nginx/python-flask-demo.error.log
```


## Install and configure uwsgi
{id: install-uwsgi}


```
apt-get install uwsgi
apt-get install uwsgi-plugin-python3
ln -s /home/dev/python-flask-demo/config/demo-uwsgi.ini /etc/uwsgi/apps-enabled/demo-uwsgi.ini
service uwsgi restart
```

If there is a problem you might find help by looking at the log file:

```
/var/log/uwsgi/app/demo-uwsgi.log
```

