PKGROOT		= /opt/provenance/cytoscape
NAME            = karma-plugin
PKGNAME         = visualization
VERSION         = v3.2.3
RELEASE 	= 0
TARBALL_POSTFIX	= tar.gz

BUILD_PROPERTIES = build.properties
VIS              = visualization/OPM_visualization
QUERY            = visualization/Karma_query

RPM.EXTRAS = %define __os_install_post %{nil}

