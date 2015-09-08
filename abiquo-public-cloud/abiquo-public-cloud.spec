%define abiquo_basedir /opt/abiquo

Name:     abiquo-public-cloud
Version:  %{getenv:ABIQUO_VERSION}
Release:  %{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}
Summary:  Abiquo Public Cloud Services
Group:    Development/System 
License:  Multiple 
URL:      http://www.abiquo.com 
Source0:  README 
Source1:  abiquo.properties.remoteservices
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
Requires: abiquo-vsm abiquo-ssm abiquo-nodecollector abiquo-am abiquo-virtualfactory abiquo-cpp dhcp 
Conflicts: abiquo-remote-services
BuildArch: noarch

%description
Next Generation Cloud Management Solution

This package installs Abiquo Remote Services components for public cloud only.

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software.

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{_docdir}/%{name}/
mkdir -p $RPM_BUILD_ROOT/%{abiquo_basedir}/config/examples/
cp ../SOURCES/README $RPM_BUILD_ROOT/%{_docdir}/%{name}/
cp %{SOURCE1} $RPM_BUILD_ROOT/%{abiquo_basedir}/config/examples/


%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%doc %{_docdir}/%{name}/README
%{abiquo_basedir}/config/examples/abiquo.properties.remoteservices

%changelog
* Fri Aug 07 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-1
- Bumped 3.6.0

* Thu Apr 30 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-2
- Removed redis dep (sergio.pena+rpmbaker@abiquo.com)

* Tue Apr 21 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-1
- Bumped 3.4.0 (sergio.pena+rpmbaker@abiquo.com)

* Fri Oct 31 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2.0-1
- Bumped 3.2.0 (sergio.pena+rpmbaker@abiquo.com)

* Wed Oct 01 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.1.0-2
- new package built with tito

* Mon Jul 28 2014 sergio.pena@abiquo.com - 3.1.0-2
- Added conditional nightly build

* Mon Jun 16 2014 Marc Morata <marc.morata@abiquo.com> - 3.1.0-1
- Bumped version to 3.1.0

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com>
- Bumped version to 3.0.0GA

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.0-1
- Bumped version to 3.0.0GA
* Wed Dec 04 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- First 3.0.0 release.

