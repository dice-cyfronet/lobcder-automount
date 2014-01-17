Name:           lobcderd
Version:        1.0
Release:        1%{?dist}
Summary:        LOBCDER mount script

Group:          Utilities
License:        GPL
Source0:        lobcderd-1.0.tar.gz

#BuildRequires:  
#Requires:       

%description
Provides script to mounting LOBCDER resource.

%prep
%setup -q


%build
%configure
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT
install -D lobcderd.sh ${RPM_BUILD_ROOT}/etc/init.d/lobcderd
install -D lobcderd.conf ${RPM_BUILD_ROOT}/etc/sysconfig/lobcderd


%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root,-)
%doc



%changelog
