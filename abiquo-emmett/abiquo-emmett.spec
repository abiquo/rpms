%define abiquo_basedir /opt/abiquo

Name:     abiquo-emmett
Version:  %{getenv:ABIQUO_VERSION}
Release:  %{getenv:ABIQUO_RELEASE}%{?dist}
Summary:  Abiquo Emmett alert tool
Group:    Development/System
License:  Multiple
URL:      http://www.abiquo.com

Source0:  ../../watchtower/emmett.jar
Source1:  ../../watchtower/emmett.conf
Source2:  emmett.init

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

Requires: jdk

%description
Next Generation Cloud Management Solution

This package contains Delorean module

%install
rm -rf $RPM_BUILD_ROOT

%{__install} -Dp -m 0644 %{SOURCE0} %{buildroot}%{abiquo_basedir}/watchtower/emmett/bin/emmett.jar
%{__install} -Dp -m 0644 %{SOURCE1} %{buildroot}%{_sysconfdir}/abiquo/watchtower/emmett.conf
%{__install} -Dp -m 0755 %{SOURCE2} %{buildroot}%{_initrddir}/abiquo-emmett

%clean
rm -rf $RPM_BUILD_ROOT

%post
chkconfig --add abiquo-emmett

%postun

%files
%defattr(-,root,root,-)
%{abiquo_basedir}/watchtower/emmett
%{_initrddir}/abiquo-emmett
%config(noreplace) %{_sysconfdir}/abiquo/watchtower/emmett.conf

%changelog
* Tue Feb 9 2016 Sergio Pena <sergio.pena@abiquo.com> 3.8
Fix init scripts. Modify path files

* Mon Oct 19 2015 Sergio Pena <sergio.pena@abiquo.com> 3.8
Initial release
