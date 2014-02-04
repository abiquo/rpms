%define abiquo_basedir /opt/abiquo

Name:     abiquo-m
Version:  3.0.0
Release:  1%{?dist}%{?buildstamp}
Summary:  Abiquo Metering
Group:    Development/System 
License:  Multiple 
URL:      http://www.abiquo.com 
Source0:  %{?abiquo_binaries_url}m.war
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


%changelog
* Thu Dec 05 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- Bumped version to 3.0.0

* Wed May 08 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6.0-1
- Initial release
