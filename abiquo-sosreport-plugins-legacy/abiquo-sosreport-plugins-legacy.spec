%define python_sitelib /usr/lib/python2.6/site-packages/

Summary: Abiquo SOSReport plugins legacy
Name: abiquo-sosreport-plugins-legacy
Version:  		%{getenv:ABIQUO_VERSION}
Release:  		%{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}
License: BSD 
Group: System Environment/Base
URL: http://www.abiquo.com/
Vendor: Abiquo Repository, http://www.abiquo.com
Requires: sos < 3.0
BuildArch: noarch

Source0: https://raw.github.com/abiquo/abiquo-report-sos-plugin/legacy/abiquo_node.py
Source1: https://raw.github.com/abiquo/abiquo-report-sos-plugin/legacy/abiquo_xen_node.py
Source2: https://raw.github.com/abiquo/abiquo-report-sos-plugin/legacy/abiquo_server.py
Source3: https://raw.github.com/abiquo/abiquo-report-sos-plugin/legacy/abiquo_dhcp.py
Source4: https://raw.github.com/abiquo/abiquo-report-sos-plugin/legacy/abiquo_rs.py
Source5: https://raw.github.com/abiquo/abiquo-report-sos-plugin/legacy/abiquo_v2v.py
Source6: https://raw.github.com/abiquo/abiquo-report-sos-plugin/legacy/abiquo_lvm.py
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
This package contains Abiquo sosreport plugins.

%install
%{__rm} -rf %{buildroot}
mkdir -p %{buildroot}%{python_sitelib}/sos/plugins
%{__install} -Dp -m 0755 %{_sourcedir}/abiquo_node.py %{buildroot}/%{python_sitelib}/sos/plugins/
%{__install} -Dp -m 0755 %{_sourcedir}/abiquo_xen_node.py %{buildroot}/%{python_sitelib}/sos/plugins/
%{__install} -Dp -m 0755 %{_sourcedir}/abiquo_server.py %{buildroot}/%{python_sitelib}/sos/plugins/
%{__install} -Dp -m 0755 %{_sourcedir}/abiquo_dhcp.py %{buildroot}/%{python_sitelib}/sos/plugins/
%{__install} -Dp -m 0755 %{_sourcedir}/abiquo_rs.py %{buildroot}/%{python_sitelib}/sos/plugins/
%{__install} -Dp -m 0755 %{_sourcedir}/abiquo_v2v.py %{buildroot}/%{python_sitelib}/sos/plugins/
%{__install} -Dp -m 0755 %{_sourcedir}/abiquo_lvm.py %{buildroot}/%{python_sitelib}/sos/plugins/

%clean
%{__rm} -rf %{buildroot}

%files
%defattr(-, root, root, 0755)
%{python_sitelib}/sos/plugins/*

%changelog
* Thu Oct 15 2015 mcirauqui <marc.cirauqui@abiquo.com> 3.6.0-1
- Cahnged to legacy for SOS < 3.0 (marc.cirauqui@abiquo.com)

* Fri Oct 31 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2.0-1
- Bumped 3.2.0 (sergio.pena+rpmbaker@abiquo.com)

* Wed Oct 01 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.1.0-1
- new package built with tito

* Mon Jun 16 2014 Marc Morata <marc.morata@abiquo.com> - 3.1.0-1
- Bumped version to 3.1.0

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com>
- Bumped version to 3.0.0GA

* Fri Jan 10 2014 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-2
- Changed install attributes

* Fri Jan 10 2014 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- Bumped version to 3.0.0

* Tue Apr 23 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6.0-1
- Bumped version to 2.6.0

* Tue Feb 19 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.4.0-2
- Added V2V and LVM profiles.

* Wed Dec 05 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.4.0-1
- Bumped version to 2.4.0

* Tue Oct 23 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.3.0-1
- bumped version to 2.3.0

* Fri Aug 31 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2.0-1
- new versioning

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
