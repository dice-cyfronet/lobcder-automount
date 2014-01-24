Summary: Automount LOBCDER VPH-Share resource
Name: lobcderd
Version: 0.0.1
Release: 1
Source0: lobcderd-0.0.1.tar.gz
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
install -m 0755 -d $RPM_BUILD_ROOT/etc/lobcderd
install -m 0755 get_ticket.sh $RPM_BUILD_ROOT/etc/lobcderd/get_ticket.sh
install -m 0755 parse_ticket.sh $RPM_BUILD_ROOT/etc/lobcderd/parse_ticket.sh
install -m 0755 short_token.sh $RPM_BUILD_ROOT/etc/lobcderd/short_token.sh
install -m 0644 lobcderd.conf $RPM_BUILD_ROOT/etc/lobcderd/lobcderd.conf
install -m 0755 -d $RPM_BUILD_ROOT/etc/init.d
install -m 0755 lobcderd $RPM_BUILD_ROOT/etc/init.d/lobcderd
%clean
rm -rf $RPM_BUILD_ROOT
%post
chkconfig --add lobcderd
service lobcderd start
%preun
chkconfig --del lobcderd
service lobcderd stop
%files
%dir /etc/lobcderd
/etc/lobcderd/get_ticket.sh
/etc/lobcderd/parse_ticket.sh
/etc/lobcderd/short_token.sh
/etc/init.d/lobcderd
/etc/default/lobcderd.conf