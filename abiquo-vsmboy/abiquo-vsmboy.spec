%define abiquo_basedir /opt/abiquo

Name:     abiquo-vsmboy
Version:  %{getenv:ABIQUO_VERSION}
Release:  %{getenv:ABIQUO_RELEASE}%{?dist}
Summary:  Abiquo VSM API tool
Group:    Development/System
License:  Multiple
URL:      http://www.abiquo.com

Source0:  ../../vsmboy.jar

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

%description
Next Generation Cloud Management Solution

This package contains VSM API tool

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT%{abiquo_basedir}/utilities/vsmboy
cp %{SOURCE0} $RPM_BUILD_ROOT%{abiquo_basedir}/utilities/vsmboy

%clean
rm -rf $RPM_BUILD_ROOT

%post

%postun

%files
%defattr(-,root,root,-)
%{abiquo_basedir}/utilities/vsmboy/*

%changelog
* Mon Oct 19 2015 Sergio Pena <sergio.pena@abiquo.com> 3.6.2
Initial release