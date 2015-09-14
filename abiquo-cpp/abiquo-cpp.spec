%define abiquo_basedir /opt/abiquo

Name:     abiquo-cpp
Version:  %{getenv:ABIQUO_VERSION}
Release:  %{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}
Summary:  Abiquo Cloud Provider Proxy
Group:    Development/System 
License:  Multiple 
URL:      http://www.abiquo.com 
Source0:  ../../cpp.war
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
Requires: abiquo-core
BuildArch: noarch

%description
Next Generation Cloud Management Solution

This package contains the cloud provider proxy component.

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software.

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{abiquo_basedir}/tomcat/webapps/
mkdir -p $RPM_BUILD_ROOT/%{_docdir}/%{name}
/usr/bin/unzip -d $RPM_BUILD_ROOT/%{abiquo_basedir}/tomcat/webapps/cpp/ %{SOURCE0}

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%{abiquo_basedir}/tomcat/webapps/cpp
%config(noreplace) %{abiquo_basedir}/tomcat/webapps/cpp/WEB-INF/classes/logback.xml

%changelog
* Wed Aug 05 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-1
- Bumped to 3.6.0 (sergio.pena+rpmbaker@abiquo.com)

* Wed Nov 26 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.3-1.master
- Added Epoch (sergio.pena+rpmbaker@abiquo.com)
- Added Epoch (sergio.pena+rpmbaker@abiquo.com)

* Wed Oct 29 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2-1.master
- Prevent logback conf to be overwritten (sergio.pena+rpmbaker@abiquo.com)

* Thu Oct 02 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.1.1-1
- New package built with tito
- Bumped version to 3.1.1

* Mon Jul 28 2014 sergio.pena@abiquo.com - 3.1.0-2
- Added conditional nightly build

* Mon Jun 16 2014 Marc Morata <marc.morata@abiquo.com> - 3.1.0-1
- Bumped version to 3.1.0

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.0GA-1
- Bumped version to 3.0.0GA

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com>
- Bumped version to 3.0.0GA

* Thu May 01 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.2-1
- Bumped version to 3.0.2

* Thu Dec 05 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- First 3.0.0 release.


