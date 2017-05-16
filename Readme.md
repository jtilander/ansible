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



## TODO

* Build the pip packages with an external docker image to minimize this image's size.
