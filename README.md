Howto
=====

deb package (debian, ubuntu)
----------------------------

To build deb package:
  * Install 'equivs' in version >=2.0.9 (see: [#636310](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=636310) )
  * Invoke script 'create-deb.sh' in ./pkg/deb-pkg/

pak package (arch)
------------------

To build pak package:
  * Invoke script 'create-pkg.sh' in ./pkg/pkg-pkg/

rpm package (redhat, centos)
----------------------------

To build rpm package
  * Install 'rpm-build' (CentOS), 'redhat-rpm-config' (CentOS), 'rpmdevtools' (EPEL for CentOS)
  * Invoke script 'create-rpm.sh' in ./pkg/rpm-pkg/
