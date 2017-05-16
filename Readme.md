# jtilander/ansible

Image to run the ansible controller.


## Usage

There is a script called ansible.sh that you can use as a frontend to the ansible command. This script takes two environment variables as parameters:

|Variable     |Default | Notes|
|-------------|--------|------|
|WORKDIR      |$PWD    |Specifies where your ansible.cfg + hosts + playbooks are checked out|
|DEBUG        |0       |Echos additional debugging information if set to 1|


For example, assuming that you have some ansible config checked out in ~/work/config, this will ping all your nodes:

```
WORKDIR=~/work/config ./ansible.sh all -m ping
```


## Config directory

The WORKDIR points at a directory that contains the ansible configuration as well as your ssh credentials. This directory will be mapped as the home directory in the docker container.

A minimal config will contain the following:

|File | Purpose|
|-----|--------|
|.ssh/id_rsa|The SSH key needed to access the systems|
|ansible.cfg|configuration file for ansible|
|hosts|ansible.cfg will have to point at this file to determin the hosts|



## Windows notes


CredSSP and TLS 1.2
CredSSP requires the remote host to have TLS 1.2 configured or else the connection will fail. TLS 1.2 is installed by default from Server 2012 and Windows 8 onwards. For Server 2008, 2008 R2 and Windows 7 you can add TLS 1.2 support by:

Installing the TLS 1.2 [update from Microsoft](https://support.microsoft.com/en-us/help/3080079/update-to-add-rds-support-for-tls-1.1-and-tls-1.2-in-windows-7-or-windows-server-2008-r2)
Adding the TLS 1.2 registry keys as shown on [this page](https://technet.microsoft.com/en-us/library/dn786418.aspx#BKMK_SchannelTR_TLS12)





## TODO

* Build the pip packages with an external docker image to minimize this image's size.
