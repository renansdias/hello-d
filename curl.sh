#!/bin/bash

x=0
load_balancer_url=a74f720fb799e11e682650e055176b25-1959506527.us-east-1.elb.amazonaws.com/

while [[ true ]]; do
       	curl $load_balancer_url
       	printf "\n"

       	if [[ `expr $x % 2` = 0 ]]; then
       		printf "+\n"
       	else
       		printf "*\n"
       	fi

       	x=`expr $x + 1`
       	sleep 0.5
done