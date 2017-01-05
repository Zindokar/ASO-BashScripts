#!/bin/bash
if [[ ! -d "/backups" ]]
then
	mkdir /backups
fi

find /home ! -user root -type f -newer "$(ls -t /backups | grep '*_level0.tgz' | tail -1)" | tar czf tar czf /backups/home_$(date +"%Y%m%d")_level1.tgz -T -
