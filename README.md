provenance
==========

Provenance Collection Tools Roll


Dependencies
------------
cytoscape - http://www.cytoscape.org/download.php

http://chianti.ucsd.edu/Cyto-2_8_1/cytoscape-2.8.1.tar.gz

erlang - http://www.erlang.org/download/otp_src_R16B01.tar.gz

Assumptions
-----------
Frontend:
 - karma server ( need to set attribute karma_server )
 - karma messaging client 
 - karma adaptor (connect to karma server)
 - karma vis plugin 
Karma adaptors connect to Karma server 

Roll build
----------
Check out the roll source 
   - cd provenance
   - ./bootstrap.sh 
   - make roll


Configuration used
-------------------
mysql 
   - dbname: karmadb
   - dbuser: karma (password is generated at roll install time)

rabbitmq 
   - users: karmaserver, karmaclient (password is generated at roll install time)
   - port 5672


Roll install
------------
The roll provides installation for karma server or karma client. 

Client installaton  : 
-	karma messaging client
-	karma visualization plugin
-	cytoscape (dependency)
-	erlang  (dependency)

Server installaton  : 
-	client installation
-	karma server
-	rabbitmq server

If installing karma server need to set a host attribute before adding the roll:

   **rocks set host attr localhost karma_server true**

