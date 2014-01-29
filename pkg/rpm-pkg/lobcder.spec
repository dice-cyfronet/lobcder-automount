Summary: Automount LOBCDER VPH-Share resource
Name: lobcder
Version: 0.0.1
Release: 1
Source0: lobcder-0.0.1.tar.gz
License: GPL
BuildArch: noarch
BuildRoot: %{_tmppath}/%{name}-buildroot
Requires: davfs2, curl
%description
Provide automount scripts to mount LOBCDER resource via davfs.
%prep
%setup -q
%build
%install
install -m 0755 -d $RPM_BUILD_ROOT/etc/lobcder
install -m 0755 get_ticket.sh $RPM_BUILD_ROOT/etc/lobcder/get_ticket.sh
install -m 0755 parse_ticket.sh $RPM_BUILD_ROOT/etc/lobcder/parse_ticket.sh
install -m 0755 short_token.sh $RPM_BUILD_ROOT/etc/lobcder/short_token.sh
install -m 0644 lobcder.conf $RPM_BUILD_ROOT/etc/lobcder/lobcder.conf
install -m 0755 -d $RPM_BUILD_ROOT/etc/init.d
install -m 0755 lobcder $RPM_BUILD_ROOT/etc/init.d/lobcder
%clean
rm -rf $RPM_BUILD_ROOT
%post
chkconfig --add lobcder
service lobcder start
%preun
chkconfig --del lobcder
service lobcder stop
%files
%dir /etc/lobcder
/etc/lobcder/get_ticket.sh
/etc/lobcder/parse_ticket.sh
/etc/lobcder/short_token.sh
/etc/init.d/lobcder
/etc/lobcder/lobcder.conf