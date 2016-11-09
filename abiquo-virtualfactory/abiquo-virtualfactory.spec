%define abiquo_basedir /opt/abiquo

Name:     abiquo-virtualfactory
Version:  		%{getenv:ABIQUO_VERSION}
Release:  		%{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}

Summary:  Abiquo Virtualfactory
Group:    Development/System 
License:  Multiple 
URL:      http://www.abiquo.com 

Source0:  ../../virtualfactory.war

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch: noarch

Requires: abiquo-core genisoimage

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
%config(noreplace) %{abiquo_basedir}/tomcat/webapps/virtualfactory/WEB-INF/classes/logback.xml

%changelog
* Fri Aug 07 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-1
- Bumped to 3.6.0

* Tue Apr 21 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-0
- Bumped to 3.4.0 (sergio.pena+rpmbaker@abiquo.com)

* Mon Feb 23 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4-2.master
- Added branch env variable (sergio.pena+rpmbaker@abiquo.com)

* Mon Dec 01 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.3-1.master
- Added Epoch (sergio.pena+rpmbaker@abiquo.com)

* Wed Oct 29 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2-1.master
- Bumped 3.2 (sergio.pena+rpmbaker@abiquo.com)

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
- Bumped version to 3.0.0

* Tue Apr 23 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6.0-2
- Bumped version to 2.6.0

* Wed Dec 05 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.4.0-1
- Bumped version to 2.4.0

* Tue Oct 23 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.3.0-1
- bumped version to 2.3.0

* Fri Aug 31 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2.0-1
- new versioning

* Fri Jun 08 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2-1
- Bumped version to 2.2

* Thu Apr 19 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0-2
- 2.0-HF1 bump

* Thu Feb 23 2012 Sergio Rubio <srubio@abiquo.com> - 2.0-1
- initial release


