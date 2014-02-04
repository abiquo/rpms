%define abiquo_basedir /opt/abiquo

Name:     abiquo-public-cloud
Version:  3.0.0
Release:  1%{?dist}
Summary:  Abiquo Public Cloud Services
Group:    Development/System 
License:  Multiple 
URL:      http://www.abiquo.com 
Source0:  README 
Source1:  abiquo.properties.remoteservices
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
Requires: abiquo-vsm abiquo-ssm abiquo-nodecollector abiquo-am abiquo-virtualfactory dhcp redis
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
* Wed Dec 04 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- First 3.0.0 release.

