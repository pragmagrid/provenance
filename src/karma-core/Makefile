# $Id$
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		         version 5.6 (Emerald Boa)
# 		         version 6.1 (Emerald Boa)
# 
# Copyright (c) 2000 - 2013 The Regents of the University of California.
# All rights reserved.	
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright
# notice unmodified and in its entirety, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided 
# with the distribution.
# 
# 3. All advertising and press materials, printed or electronic, mentioning
# features or use of this software must display the following acknowledgement: 
# 
# 	"This product includes software developed by the Rocks(r)
# 	Cluster Group at the San Diego Supercomputer Center at the
# 	University of California, San Diego and its contributors."
# 
# 4. Except as permitted for the purposes of acknowledgment in paragraph 3,
# neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".  For licensing of 
# the associated name, interested parties should contact Technology 
# Transfer & Intellectual Property Services, University of California, 
# San Diego, 9500 Gilman Drive, Mail Code 0910, La Jolla, CA 92093-0910, 
# Ph: (858) 534-5815, FAX: (858) 534-7345, E-MAIL:invent@ucsd.edu
# 
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# @Copyright@
#
# $Log$

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

SCRIPTS = karma.properties build-server  karmaServer

SEDSPEC += \
	-e 's%@KARMAHOME@%$(PKGROOT)%g' 

karma.properties: karma.properties.in
	$(SED) $(SEDSPEC) $^ > $@

karmaServer: karmaServer.in
	$(SED) $(SEDSPEC) $^ > $@

build-server: build-server.in
	$(SED) $(SEDSPEC) $^ > $@
	chmod +x build-server

build:  $(SCRIPTS)
	tar xzvf karma-$(VERSION)-$(PKGNAME).tar.gz 
	sed -i 's/karma\.log/\/var\/log\/karma\.log/' $(PKGNAME)/config/log4j.properties 
	(                                                                              \
		cd $(PKGNAME);                                                         \
		ant karma.messaging;                                                   \
		../build-server;                                                       \
	)
	
install::
	mkdir -p $(ROOT)/$(PKGROOT)
	mkdir -p $(ROOT)/$(PKGROOT)/bin
	mkdir -p $(ROOT)/$(PKGROOT)/etc
	mkdir -p $(ROOT)/$(PKGROOT)/lib
	(							\
		cd $(PKGNAME); \
		cp lib/*.jar $(ROOT)/$(PKGROOT)/lib;            \
		cp build/*.jar $(ROOT)/$(PKGROOT)/lib;          \
		cp -r build/classes/ $(ROOT)/$(PKGROOT)/lib;          \
		cp -r config/ $(ROOT)/$(PKGROOT);               \
	)

	install -m 644 karma.properties $(ROOT)/$(PKGROOT)/config
	install -m 755 $(PKGNAME)/KarmaServer.sh $(ROOT)/$(PKGROOT)/bin

	mkdir -p $(ROOT)/etc/rc.d/init.d/
	install -m 755 karmaServer  $(ROOT)/etc/rc.d/init.d/


clean::
	rm -rf $(PKGNAME)
	rm -rf $(SCRIPTS)

