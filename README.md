# How to build a PPA for Launchpad using Docker
For build PPA of latest version Netatalk (currently 3.1.8), need to create your Launchpad account install dependencies

## How to create Personal Package Archive (PPA) on Launchpad
Before Netatalk build, you need to create Launchpad account and upload to it your OpenPGP keys. If you already have an account and your keys already uploaded, you can skip this step.

1. **Obtain Launchpad account**
You can find good instruction how to create Launchpad account at the Launchpad itself [Creating a new account](https://help.launchpad.net/YourAccount/NewAccount)
1. **Create OpenPGP key and upload it to Launchpad**
Also, good instruction you can reach on the [Import your PGP key](https://help.launchpad.net/YourAccount/ImportingYourPGPKey) on Launchpad. 

## Build Netatalk PPA
Before building, you need to install Docker.
```
sudo apt-get install -y docker.io make
```
For build PPA from your current user, you need to add your account to docker group and start to use this group in your current shell:
```
sudo usermod -aG docker $(whoami)
newgrp docker
```
Now, your system ready for building PPA. Let's start

### Build Netatalk PPA
This commands clone repository and builds .deb package for your system.
```
git clone https://github.com/sbc-nerds/netatalk-ppa.git
cd netatalk-ppa
make local
```
After this command you get `netatalk_3.1.8-0ppa3~wily_amd64.deb` in your current directory. You can try to install builded version of Netatalk by command: 
```
sudo dpkg -i netatalk_3.1.8-0ppa3~wily_amd64.deb
```

If you want to upload built Netatalk PPA to your Launchpad run that command and answer in interactive mode to several question.
```
make dist
``` 

## Userful links
- [Netatalk home page](http://netatalk.sourceforge.net) with [configuration examples](http://netatalk.sourceforge.net/wiki/index.php/Install_Netatalk_3.1.8_on_Ubuntu_16.04_Xenial#Setting_Up)
- [How to configure Netatalk for home usage](https://www.outcoldman.com/en/archive/2014/11/09/ubuntu-as-home-server-part-3-afp-server/)