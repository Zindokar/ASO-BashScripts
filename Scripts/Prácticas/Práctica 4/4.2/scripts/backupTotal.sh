#!/bin/bash
if [[ ! -d "/backups" ]]
then
	mkdir /backups
fi

find /home ! -user root | tar czf /backups/home_$(date +"%Y%m%d")_level0.tgz -T -
