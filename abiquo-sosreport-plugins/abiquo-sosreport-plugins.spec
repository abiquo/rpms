%if 0%{?rhel} >= 6
%define python_sitelib /usr/lib/python2.6/site-packages/
%else
%define python_sitelib /usr/lib/python2.4/site-packages/
%endif

Summary: Abiquo SOSReport plugins
Name: abiquo-sosreport-plugins
Version: 2.2
Release: 1%{?dist}
License: BSD 
Group: System Environment/Base
URL: http://www.abiquo.com/
Vendor: Abiquo Repository, http://www.abiquo.com
Requires: sos 
BuildArch: noarch

Source0: abiquo_node.py
Source1: abiquo_xen_node.py
Source2: abiquo_server.py
Source3: abiquo_dhcp.py
Source4: abiquo_rs.py
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
This package contains Abiquo sosreport plugins.

%install
%{__rm} -rf %{buildroot}
mkdir -p %{buildroot}%{python_sitelib}/sos/plugins
%{__cp} %{_sourcedir}/abiquo_node.py %{buildroot}/%{python_sitelib}/sos/plugins/
%{__cp} %{_sourcedir}/abiquo_xen_node.py %{buildroot}/%{python_sitelib}/sos/plugins/
%{__cp} %{_sourcedir}/abiquo_server.py %{buildroot}/%{python_sitelib}/sos/plugins/
%{__cp} %{_sourcedir}/abiquo_dhcp.py %{buildroot}/%{python_sitelib}/sos/plugins/
%{__cp} %{_sourcedir}/abiquo_rs.py %{buildroot}/%{python_sitelib}/sos/plugins/

%clean
%{__rm} -rf %{buildroot}

%files
%defattr(-, root, root, 0755)
%{python_sitelib}/sos/plugins/*

%changelog
* Tue Jul 03 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2-1
- 2.2 bump

* Thu Mar 17 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.5-1
- version bump
- plugins updated

* Tue Feb 22 2011 Sergio Rubio <srubio@abiquo.com> - 1.1-3
- set buildarch to noarch

* Tue Feb 22 2011 Sergio Rubio <srubio@abiquo.com> - 1.1-2
- added dist tag to Release

* Tue Feb 22 2011 Sergio Rubio <srubio@abiquo.com> - 1.1-1
- upstream update

* Mon Sep 27 2010 Sergio Rubio <srubio@abiquo.com> - 1.0-2
- Updated scripts

* Fri Jun 04 2010 Sergio Rubio <srubio@abiquo.com> - 1.0-1
- Initial Release
