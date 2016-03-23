# local-dev-automation
scripts to setup local dev env using vagrant and ansible.

1. NodeDev
2. RubyOnRailsDev (coming soon)

- - -

* **NodeDev**

Quick guide:

```
sh setup.sh
```
and open localhost:3000 on your browser.

- - -

Full Details:

This has a nodejs app, that I found on Github by [Code52](http://code52.org/)

more about app:: **Code52:saywat** https://github.com/Code52/saywat

run ```sh setup.sh``` to setup the env.

This will clone the repo. run npm install and sync the folder with vm.

Idea behind cloning it outside the vm is so the dev can continue to code and changes are synced automatically inside the vm.

run ```sh reload.sh``` to reload supervisord to restart the application.

run ```sh clean.sh``` to clean the setup. (this will destroy the vm and delete the code folder)

_Provisioning is done by Ansible_.

**_provision/setup/tasks_** will install all the required packages

**_provision/deploy/tasks_** will setup app with supervisord and start the app as service.
- - -
