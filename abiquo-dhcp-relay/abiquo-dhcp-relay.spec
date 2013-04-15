Name:     abiquo-dhcp-relay
Version:  2.4.0
Release:  1%{?dist}
Summary:  Abiquo DCHP Relay scripts
Group:    Development/System
License:  Multiple 
URL:      http://www.abiquo.com 
Source0:  abiquo-relay-scripts.py
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
Requires: dhcp vconfig
BuildArch: noarch

%description
Next Generation Cloud Management Solution

This package installs Abiquo DHCP Relay scripts.

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{_docdir}/%{name}
mkdir -p $RPM_BUILD_ROOT/%{_bindir}/
cp %{SOURCE0} $RPM_BUILD_ROOT/%{_bindir}/abiquo-dhcp-relay
chmod +x $RPM_BUILD_ROOT/%{_bindir}/abiquo-dhcp-relay

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%{_bindir}/abiquo-dhcp-relay

%changelog
* Wed Dec 05 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.4.0-1
- Bumped version to 2.4.0

* Wed Nov 21 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.3.0-1
- Bumped version to 2.4

* Tue Oct 23 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.3.0-1
- bumped version to 2.3.0

* Fri Aug 31 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2.0-1
- new versioning

* Wed Jun 06 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2-1
- Bumped version to 2.2

* Mon Dec 19 2011 Sergio Rubio <srubio@abiquo.com> - 2.0-1
- bumped version to 2.0

* Wed May 25 2011 Sergio Rubio <srubio@abiquo.com> - 1.8-1
- updated to 1.8

* Thu Mar 17 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.5-1
- version bump

* Thu Mar 03 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-3
- make abiquo-dhcp-relay executable
- update relay script

* Mon Feb 28 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-2
- updated relay script

* Fri Feb 25 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-1
- initial release
