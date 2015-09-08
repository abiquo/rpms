%define abiquo_basedir /opt/abiquo

Name:     abiquo-m
Version:  %{getenv:ABIQUO_VERSION}
Release:  %{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}
Summary:  Abiquo Metering
Group:    Development/System 
License:  Multiple 
URL:      http://www.abiquo.com 
Source0:  ../../m.war
Source1:  m.xml
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
Requires: abiquo-core
BuildArch: noarch
BuildRequires: unzip

%description
Next Generation Cloud Management Solution

This package contains the enterprise m component.

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software.


%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{abiquo_basedir}/tomcat/webapps/m
mkdir -p $RPM_BUILD_ROOT/%{_docdir}/%{name}
mkdir -p $RPM_BUILD_ROOT/%{abiquo_basedir}/tomcat/conf/Catalina/localhost/
/usr/bin/unzip -d $RPM_BUILD_ROOT/%{abiquo_basedir}/tomcat/webapps/m/ %{SOURCE0}
cp %{SOURCE1} $RPM_BUILD_ROOT/%{abiquo_basedir}/tomcat/conf/Catalina/localhost/


%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%{abiquo_basedir}/tomcat/webapps/m
%config(noreplace) %{abiquo_basedir}/tomcat/conf/Catalina/localhost/m.xml
%config(noreplace) %{abiquo_basedir}/tomcat/webapps/m/WEB-INF/classes/logback.xml

%changelog
* Fri Aug 07 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-1
- Bumped 3.6.0

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

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.0GA-1
- Bumped version to 3.0.0GA

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com>
- Bumped version to 3.0.0GA

* Thu May 01 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.2-1
- Bumped version to 3.0.2
* Thu Dec 05 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- Bumped version to 3.0.0

* Wed May 08 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6.0-1
- Initial release
