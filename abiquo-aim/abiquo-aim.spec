%define git_release 2.2.1
%define abiquo_version 3.0

Name:           abiquo-aim
BuildRequires:  hiredis gcc-c++ thrift-cpp-devel boost-devel curl-devel libvirt-devel 
Requires:	libvirt hiredis boost bridge-utils
Version:        %{abiquo_version}rel%{git_release}
Release:        2%{?dist}
Url:            http://www.abiquo.com/
License:        BSD(or similar)
Group:          System/Management
Summary:        Abiquo Cloud Node Agent
Source:         http://mirror.abiquo.com/sources/abiquo-aim-%{version}.tar.gz 
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
Source1:	abiquo-aim.ini
Source2:	abiquo-aim.init
# Remove this stuff for the next version
%if 0%{?rhel} == 6
BuildRequires:  libuuid-devel
%endif

%description
Summary:        Abiquo Cloud Node Agent


Authors:
--------
    Abiquo Development Team

%prep
%setup -q
# Prepare version.c
cd $RPM_BUILD_DIR/%{name}-%{version}/src
sh gen-version.sh

%build
CPATH="/usr/include/thrift:/usr/include/hiredis" make

%install
mkdir -p $RPM_BUILD_ROOT/%{_sbindir}/
mkdir -p $RPM_BUILD_ROOT/%{_sysconfdir}/rc.d/init.d
mkdir -p $RPM_BUILD_ROOT/%{_datadir}/abiquo-aim/
cp $RPM_BUILD_DIR/%{name}-%{version}/src/aim $RPM_BUILD_ROOT/%{_sbindir}/abiquo-aim
cp %{SOURCE1} $RPM_BUILD_ROOT/%{_sysconfdir}/abiquo-aim.ini
cp %{SOURCE2} $RPM_BUILD_ROOT/%{_sysconfdir}/rc.d/init.d/abiquo-aim

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%{_sbindir}/abiquo-aim
%config(noreplace) %{_sysconfdir}/abiquo-aim.ini
%{_sysconfdir}/rc.d/init.d/abiquo-aim
# Remove this stuff for the next version

%post
/sbin/chkconfig --add abiquo-aim
if ! [ -d /var/lib/virt ]; then
	mkdir -p /var/lib/virt 
fi
if ! [ -d /opt/vm_repository ]; then
	mkdir -p /opt/vm_repository
fi

%changelog
* Tue Jan 07 2014 Abel Boldú <abel.boldu@abiquo.com> - 3.0rel2.2.1-2
- Removed monitor from config.

* Tue Jan 07 2014 Abel Boldú <abel.boldu@abiquo.com> - 3.0rel2.2.1-1
- New upstream version.

* Tue Oct 22 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel2.1.6-1
- Bumped version to 2.1.6

* Fri Sep 20 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel2.1.4-1
- ABICLOUDPREMIUM-4864

* Fri Aug 30 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel2.1.3-1
- ABICLOUDPREMIUM-5990

* Tue Aug 13 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel2.1.2-1
- Check primary disk existence on domain listing
- Added pugixml as XPath library

* Fri Aug 02 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel2.1.1-1
- List ISCSI pools

* Thu Jul 25 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel2.1.0-1
- Upstream version.

* Thu Jul 04 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel2.0.0-1
- Changed version to 2.0.0

* Thu Jun 27 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel1.6.1-4
- Added bridge-utils dep, stop service fix

* Mon Jun 17 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel1.6.1-3
- Init signal fixed.

* Wed Jun 12 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel1.6.1-2
- blockresize fix. service stop fix

* Tue Jun 11 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel1.6.1-1
- upstream version 1.6.1

* Mon Jun 10 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel1.6.0-2
- new abiquo-aim.ini

* Fri May 31 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6rel1.6.0-1
- New 1.6.0 version, only for el6 builds (new libvirt and qemu required).

* Tue Nov 20 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2rel1.5.2-2
- Patch for rhel6

* Tue Oct 30 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2rel1.5.2-1
- Bridges bugfix

* Mon Sep 03 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2rel1.5.1-1
- bumped version 2.2

* Wed Aug 22 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0rel1.4.5-1
- bumped version, valid datastore types setting

* Fri Jul 20 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0rel1.4.4-1
- bumped version

* Tue Apr 24 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0rel1.4.2-2
- NFS check removed from service

* Wed Mar 14 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0rel1.4.2-1
- new upstream version

* Thu Feb 23 2012 Sergio Rubio <srubio@abiquo.com> - 2.0rel1.4.1-1
- new upstream release

* Wed Jan 11 2012 Sergio Rubio <rubiojr@frameos.org> - 2.0rel1.4-1
- bumped version

* Mon Dec 19 2011 Sergio Rubio <srubio@abiquo.com> - 1.8rel1.4-6
- new versioning scheme

* Mon Dec 19 2011 Sergio Rubio <rubiojr@frameos.org> - 1.8-5.aimrel1.4
- upstream version 1.4
- remove ruby script to generate network iface configs

* Wed Jul 13 2011 Sergio Rubio <srubio@abiquo.com> - 1.8-4.aimrel1.3.2
- updated generate-network-files.rb script

* Thu Jul 07 2011 Sergio Rubio <srubio@abiquo.com> - 1.8-3.aimrel1.3.2
- fix rhel6 build

* Mon Jul 04 2011 Sergio Rubio <rubiojr@frameos.org> - 1.8-2.aimrel1.3.2
- use ruby binary full path

* Mon Jun 27 2011 Sergio Rubio <srubio@abiquo.com> - 1.8-1.aimrel1.3.2
- added generate-network-files script
- bumped version to 1.3.2 final

* Wed May 25 2011 Sergio Rubio <srubio@abiquo.com> - 1.8-1.0dev.aimrel1.2
- updated to 1.8

* Thu Mar 17 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.5-1.rel1.1.6
- upstream update 

* Wed Mar 09 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.0-11.rel1.1.5
- updated to 1.1.5 final 

* Tue Feb 22 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.0-10.rel1.1.5
- upstream update

* Fri Jan 28 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.0-10.rel1.1.4
- upstream update

* Fri Jan 28 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.0-9.rel1.1.4
- upstream update

* Fri Jan 28 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.0-8.rel1.1.4
- upstream update

* Fri Jan 21 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.0-7.rel1.1.3
- upstream update

* Fri Jan 21 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.0-7.rel1.1.2
- updated aim init script to check /opt/vm_repository/.abiquo_repository

* Fri Jan 14 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.0-6.rel1.1.2
- fixed changelog typo 

* Fri Jan 14 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.0-5.rel1.1.2
- updated to upstream 1.1.2

* Thu Jan 13 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.0-3.rel1.1.1
- updated to upstream 1.1.1

* Thu Dec 30 2010 Sergio Rubio <srubio@abiquo.com> - 1.7.0-2.rel1.1
- updated to upstream 20101230

* Thu Dec 16 2010 Sergio Rubio <srubio@abiquo.com> - 1.7.0-1.rel1.1
- updated to upstream 1.7.0

* Thu Sep 16 2010 Sergio Rubio <srubio@abiquo.com> 1.6.8-2.rel1.1
- Updated default config

* Thu Sep 16 2010 Sergio Rubio <srubio@abiquo.com> 1.6.8-1.rel1.1
- Updated to upstream 1.1

* Thu Sep 16 2010 Sergio Rubio <srubio@abiquo.com> 1.6.5-8.rel1.0
- Updated aim init script

* Fri Sep 10 2010 Sergio Rubio <srubio@abiquo.com> 1.6.5-7.rel1.0
- Update aim source

* Thu Sep 09 2010 Sergio Rubio <srubio@abiquo.com> 1.6.5-6
- create required dirs in post
- fixes to the init script

* Thu Sep 09 2010 Sergio Rubio <srubio@abiquo.com> 1.6.5-5
- Require boost

* Thu Sep 09 2010 Sergio Rubio <srubio@abiquo.com> 1.6.5-4
- Do not replace aim config

* Thu Sep 09 2010 Sergio Rubio <srubio@abiquo.com> 1.6.5-3
- Added config file
- Added init script

* Thu Sep 09 2010 Sergio Rubio <srubio@abiquo.com> 1.6.5-2
- Fixed deps

* Thu Sep 09 2010 Sergio Rubio <srubio@abiquo.com> 1.6.5-1
- Initial Release
