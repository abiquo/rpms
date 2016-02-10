%define abiquo_basedir /opt/abiquo

Name:     abiquo-delorean
Version:  %{getenv:ABIQUO_VERSION}
Release:  %{getenv:ABIQUO_RELEASE}%{?dist}
Summary:  Abiquo Delorean alert tool
Group:    Development/System
License:  Multiple
URL:      http://www.abiquo.com

Source0:  ../../watchtower/delorean.jar
Source1:  ../../watchtower/delorean.conf
Source2:  delorean.init
Source3:  ../../watchtower/watchtower_schema.sql

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

Requires: jdk

%description
Next Generation Cloud Management Solution

This package contains Delorean module

%install
rm -rf $RPM_BUILD_ROOT

%{__install} -Dp -m 0644 %{SOURCE0} %{buildroot}%{abiquo_basedir}/watchtower/delorean/bin/delorean.jar
%{__install} -Dp -m 0644 %{SOURCE1} %{buildroot}%{_sysconfdir}/abiquo/watchtower/delorean.conf
%{__install} -Dp -m 0755 %{SOURCE2} %{buildroot}%{_initrddir}/abiquo-delorean
%{__install} -Dp -m 0644 %{SOURCE3} %{buildroot}%{_docdir}/abiquo-watchtower/database/watchtower_schema.sql

%clean
rm -rf $RPM_BUILD_ROOT

%post
chkconfig --add abiquo-delorean

%postun

%files
%defattr(-,root,root,-)
%{abiquo_basedir}/watchtower/delorean
%{_initrddir}/abiquo-delorean
%{_docdir}/abiquo-watchtower
%config(noreplace) %{_sysconfdir}/abiquo/watchtower/delorean.conf

%changelog
* Tue Feb 9 2016 Sergio Pena <sergio.pena@abiquo.com> 3.8
Fix init scripts. Modify path files

* Mon Oct 19 2015 Sergio Pena <sergio.pena@abiquo.com> 3.8
Initial release
