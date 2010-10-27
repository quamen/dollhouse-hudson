# Dollhouse Hudson

[Dollhouse](http://github.com/geelen/dollhouse) configuration for turning a vanilla ubuntu install into a functioning hudson-ci server.

All you need to get started is a freshly install Ubuntu Machine (Mine is in VMWare) and another computer with Ruby installed.

## Usage

1. Get [Dollhouse](http://github.com/geelen/dollhouse) set up.
2. Install openssh on your Ubuntu machine.

  $ sudo apt-get install openssh-server openssh-client
  
3. Create a password for the root account on your Ubuntu machine. 

  $ sudo su -
  $ passwd
  
4. Ensure the .ssh directory is present on your Ubuntu machine's root home directory.

  $ sudo su -
  $ mkdir .ssh
  
5. From now on, everything happens on your own computer. Copy your ssh public key over to the server.

  $ scp ~/.ssh/id_rsa.pub root@remote.server.com:.ssh/authorized_keys
  
6. Update config/dollhouse/instances/server.yml with the IP address of your vanilla ubuntu machine.

7. Update config/dollhouse/auth.rb with your authentication details.

8. Giddy Up
  $ /path/to/dollhouse.rb run hudson setup
  
9. Visit http://remote.server.com:8080 and bathe in the glory of your fresh Hudson install, with the git, github, ruby and rake plugins pre-installed.

## Where's the Magic?

[Dollhouse](http://github.com/geelen/dollhouse) uses [Babushka](http://github.com/benhoskings/babushka) to build servers. The dollhouse configuration is stored in config/dollhouse/deployments/hudson.rb

Here's what the setup task does:

1. bootstraps the server, installs [Babushka](http://github.com/benhoskings/babushka) so that the rest can function.
2. Creates a hudson user with the password specified in Auth and copies the public ssh key to the hudson users account.
3. Installs Hudson and all of its dependencies.
4. Installs some useful Hudson plugins for rails.