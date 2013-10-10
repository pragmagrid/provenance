#!/bin/bash

. /opt/rocks/share/devel/src/roll/etc/bootstrap-functions.sh

yum install xmlto

compile_and_install cytoscape
compile_and_install erlang
compile_and_install karma-client

