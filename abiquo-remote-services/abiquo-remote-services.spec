%define abiquo_basedir /opt/abiquo

Name:     abiquo-remote-services
Version:  %{getenv:ABIQUO_VERSION}
Release:  %{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}
Summary:  Abiquo Remote Services
Group:    Development/System 
License:  Multiple 
URL:      http://www.abiquo.com 

Source0:  README 
Source1:  abiquo.properties.remoteservices
Source2:  ../../redis

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch: noarch

Requires: abiquo-vsm abiquo-ssm abiquo-nodecollector abiquo-am abiquo-virtualfactory dhcp nfs-utils abiquo-cpp python-redis

%description
Next Generation Cloud Management Solution

This package installs Abiquo Remote Services components.

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software.

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{_docdir}/%{name}/
mkdir -p $RPM_BUILD_ROOT/%{abiquo_basedir}/config/examples/
cp %{SOURCE0} $RPM_BUILD_ROOT/%{_docdir}/%{name}/
cp %{SOURCE1} $RPM_BUILD_ROOT/%{abiquo_basedir}/config/examples/
cp %{SOURCE2} $RPM_BUILD_ROOT/%{_docdir}/%{name}/

%clean
rm -rf $RPM_BUILD_ROOT

%post
# Add dhcpd conf
cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.bak
cat > /etc/dhcp/dhcpd.conf <<EOF
ddns-update-style interim;

omapi-port 7911;
option classless-static-routes code 121 = array of integer 8;
option ms-classless-static-routes code 249 = array of integer 8;

subnet 0.0.0.0 netmask 0.0.0.0 {
	default-lease-time 60000;
	max-lease-time 720000;
	option subnet-mask 255.255.255.0;
	option domain-name-servers 8.8.8.8;
}

EOF

%files
%defattr(-,root,root,-)
%doc %{_docdir}/%{name}/README
%doc %{_docdir}/%{name}/
%{abiquo_basedir}/config/examples/abiquo.properties.remoteservices

%changelog
* Mon Dec 30 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-2
- Changed dhcp location

* Thu Dec 05 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- Bumped version to 3.0.0
- Added abiquo-cpp

* Thu Jun 06 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6.0-3
- Libvirt dependencies removed.

* Tue Apr 23 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6.0-2
- Bumped version to 2.6.0

* Wed Dec 05 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.4.0-1
- Bumped version to 2.4.0

* Tue Oct 23 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.3.0-1
- Bumped version to 2.3.0

* Fri Aug 31 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2.0-1
- New versioning

* Fri Jun 08 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2-1
- Bumped version to 2.2

* Tue Mar 13 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0-2
- Remove tarantino, add virtualfactory again

* Mon Dec 19 2011 Sergio Rubio <srubio@abiquo.com> - 2.0-1
- bumped version to 2.0
- remove virtualfactory dep, add tarantino dep

* Fri Sep 30 2011 Sergio Rubio <srubio@abiquo.com> - 1.8.5-1
- bumped version to 1.8.5

* Wed Jun 15 2011 Sergio Rubio <rubiojr@frameos.org> - 1.8-2
- add openipmi-tools dep
- add missing default system properties for 1.8

* Tue May 31 2011 Sergio Rubio <srubio@abiquo.com> - 1.8-1
- 1.8 bump

* Thu Apr 14 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.6-1
- bumped version

* Mon Mar 28 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.5-3
- bumped release
- remove abiquo-server-tools dep

* Thu Mar 17 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.5-2
- version bump
- backup dhcpd.conf before overwriting

* Fri Mar 04 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-12
- set arch to noarch
- updated to 1.7.5

* Thu Mar 03 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-11
- add default storagemanager properties

* Wed Jan 26 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-10
- depend on abiquo-server-tools

* Mon Jan 24 2011 Sergio Rubio <srubio@abiquo.com> 1.7-9
- moved properties template to /opt/abiquo/config/examples

* Mon Jan 24 2011 Sergio Rubio <srubio@abiquo.com> 1.7-8
- fixes in files section

* Mon Jan 24 2011 Sergio Rubio <srubio@abiquo.com> 1.7-7
- fixed files section

* Mon Jan 24 2011 Sergio Rubio <srubio@abiquo.com> 1.7-6
- moved properties template to /usr/share/doc

* Wed Jan 19 2011 Sergio Rubio <srubio@abiquo.com> 1.7-5
- updated default properties

* Tue Jan 18 2011 Sergio Rubio <srubio@abiquo.com> 1.7-4
- updated default properties

* Fri Jan 14 2011 Sergio Rubio <srubio@abiquo.com> 1.7-3
- updated properties template

* Mon Jan 10 2011 Sergio Rubio <srubio@abiquo.com> 1.7-2
- add missing rabbitmq properties
- add nfs-utils to requires

* Mon Nov 22 2010 Sergio Rubio <srubio@abiquo.com> 1.7-1
- Updated to upstream 1.7

* Tue Oct 06 2010 Sergio Rubio <srubio@abiquo.com> 1.6.8-2
- added redis dep

* Tue Oct 05 2010 Sergio Rubio <srubio@abiquo.com> 1.6.8-1
- Updated to upstream 1.6.8

* Thu Sep 02 2010 Sergio Rubio srubio@abiquo.com 1.6.5-1
- updated to 1.6.5

* Fri Jul 09 2010 Sergio Rubio srubio@abiquo.com 1.6-3
- Added dhcp dep
- config dhcpd in %post

* Fri Jul 09 2010 Sergio Rubio srubio@abiquo.com 1.6-2
- Added buildstamp to the package

* Mon Jul 05 2010 Sergio Rubio srubio@abiquo.com 1.6-1
- Updated to upstream 1.6

* Wed May 26 2010 Sergio Rubio srubio@abiquo.com 1.5.1
- Initial Release
