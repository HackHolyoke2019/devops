.PHONY: sync upload apply remote-apply

USER := ec2-user
HOST := policescanner.space
UPLOAD_DIR := /srv/devops

# Manually upload latest code and apply
sync: upload remote-apply

# Upload ./salt and ./pillar directories to server 
upload:
	rsync -r Makefile ./salt ./pillar ${USER}@${HOST}:${UPLOAD_DIR}

# Apply latest Salt states to server
apply:
	sudo salt-call --local state.apply --force-color --state-output=changes

# SSH into server and run apply target
remote-apply:
	ssh ${USER}@${HOST} -- "make -C /${UPLOAD_DIR} apply"
