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
Source3:  ../../watchtower/liquibase-watchtower-data.tar.gz
Source4:  abiquo-watchtower-liquibase
Source5:  ../../watchtower/mysql-connector-java-5.1.6.jar

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

Requires: jdk liquibase

%description
Next Generation Cloud Management Solution

This package contains Delorean module

%install
rm -rf $RPM_BUILD_ROOT

%{__install} -Dp -m 0644 %{SOURCE0} %{buildroot}%{abiquo_basedir}/watchtower/delorean/bin/delorean.jar
%{__install} -Dp -m 0644 %{SOURCE1} %{buildroot}%{_sysconfdir}/abiquo/watchtower/delorean.conf
%{__install} -Dp -m 0755 %{SOURCE2} %{buildroot}%{_initrddir}/abiquo-delorean
%{__install} -Dp -m 0755 %{SOURCE4} %{buildroot}%{_bindir}/abiquo-watchtower-liquibase
#%{__install} -Dp -m 0755 %{SOURCE5} %{buildroot}%{abiquo_basedir}/watchtower/delorean/lib/
mkdir -p %{buildroot}%{_docdir}/abiquo-watchtower/database
tar xfz %{SOURCE3} -C %{buildroot}%{_docdir}/abiquo-watchtower/database

mkdir -p %{buildroot}%{abiquo_basedir}/watchtower/delorean/lib
cp %{SOURCE5} %{buildroot}%{abiquo_basedir}/watchtower/delorean/lib

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
%{_bindir}/abiquo-watchtower-liquibase

%changelog
* Tue Feb 9 2016 Sergio Pena <sergio.pena@abiquo.com> 3.8
Fix init scripts. Modify path files

* Mon Oct 19 2015 Sergio Pena <sergio.pena@abiquo.com> 3.8
Initial release
