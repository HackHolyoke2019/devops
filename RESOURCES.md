# Resources
List of resources and procedures used to set them up.

# Table Of Contents
- [Domain](#domain)

# Domain
Bought from Go Daddy.

```
policescanner.space
```

Name servers were pointed to the [Domain Hosted Zone](#domain-hosted-zone).

# Domain Hosted Zone
AWS Route 53 - Hosted Zone:

```
policescanner.space
```

Records:

- `@` - `A` - Points towards [Server](#server)

# Server
AWS EC2 - Instance named `policescanner.zone`.

Setup steps:

1. (your local computer) Copy 1st SSH public key:
   ```
   ssh-copy-id -i PATH_TO_EC2_KEYPAIR policescanner.space
   ```
2. Login as `ec2-user`:
   ```
   ssh -i PATH_TO_EC2_KEYPAIR policescanner.space
   ```
   Any instruction with "(ssh, `ec2-user`)" before it should be executed in this
   SSH session.
3. (ssh, `ec2-user`) Install [Salt](https://saltstack.com):
   ```
   sudo yum install -y https://repo.saltstack.com/py3/amazon/salt-py3-amzn2-repo-latest.amzn2.noarch.rpm
   sudo yum clean expire-cache
   sudo yum install -y salt-master salt-minion
   ```
4. (your local computer) Upload public & private keys:
   ```
   rsync ~/.ssh/KEY_NAME* ec2-user@policescanner.space:/home/ec2-user/.ssh/
   ```
   (ssh, `ec2-user`) Setup Git
   ```
   chmod 600 ~/.ssh/KEY_NAME
   chmod 644 ~/.ssh/KEY_NAME.pub
   sudo yum install -y git
   ```
5. (ssh, `ec2-user`) Clone this Git repository
   ```
   sudo groupadd devops
   sudo mkdir /srv/devops
   sudo chgrp devops /srv/devops
   sudo chmod 770 /srv/devops
   sudo usermod -aG devops ec2-user
   exit
   ```
   Login into the SSH user again and run:
   ```
   git clone git@github.com:HackHolyoke2019/devops.git /srv/devops
   ```
6. (ssh, `ec2-user`) Setup symlinks for Salt:
   ```
   sudo ln -s /srv/devops/salt/ /srv/salt/
   sudo ln -s /srv/devops/pillar /srv/pillar/
   ```
