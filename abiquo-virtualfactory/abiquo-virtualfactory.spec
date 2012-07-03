%define abiquo_basedir /opt/abiquo

Name:     abiquo-virtualfactory
Version:  2.2
Release:  1%{?dist}%{?buildstamp}
Summary:  Abiquo Virtualfactory
Group:    Development/System 
License:  Multiple 
URL:      http://www.abiquo.com 
Source0:  %{?abiquo_binaries_url}virtualfactory.war
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
Requires: abiquo-core
Obsoletes: abiquo-virtualfactory
BuildArch: noarch

%description
Next Generation Cloud Management Solution

This package contains the enterprise Virtualfactory component.

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software.

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{abiquo_basedir}/tomcat/webapps/
mkdir -p $RPM_BUILD_ROOT/%{_docdir}/%{name}
/usr/bin/unzip -d $RPM_BUILD_ROOT/%{abiquo_basedir}/tomcat/webapps/virtualfactory/ %{SOURCE0}

%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root,-)
%{abiquo_basedir}/tomcat/webapps/virtualfactory

%changelog
* Fri Jun 08 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2-1
- Bumped version to 2.2

* Thu Apr 19 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0-2
- 2.0-HF1 bump

* Thu Feb 23 2012 Sergio Rubio <srubio@abiquo.com> - 2.0-1
- initial release


