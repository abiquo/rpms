%define abiquo_basedir /opt/abiquo

Name:     abiquo-v2v
Version:  		%{getenv:ABIQUO_VERSION}
Release:  		%{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}
Summary:  Abiquo V2V Conversion Component 
Group:    Development/System 
License:  Multiple 
URL:      http://www.abiquo.com 

Source0:  ../../bpm-async.war
Source1:  ../../scripts/v2v-diskmanager
Source2:  ../../scripts/mechadora
Source3:  abiquo.properties.v2v
Source4:  ../../scripts/export-private
Source5:  ../../scripts/amz-import
Source6:  ../../scripts/raw-to-vhdflat

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch: noarch

Requires: abiquo-core vboxmanage iscsi-initiator-utils nfs-utils samba qemu-img ec2-api-tools

%description
Next Generation Cloud Management Solution

This package contains the enterprise V2V conversion component.

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software.

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{abiquo_basedir}/tomcat/webapps/
mkdir -p $RPM_BUILD_ROOT/%{abiquo_basedir}/scripts
mkdir -p $RPM_BUILD_ROOT/%{abiquo_basedir}/config/examples/
mkdir -p $RPM_BUILD_ROOT/%{_docdir}/%{name}
/usr/bin/unzip -d $RPM_BUILD_ROOT/%{abiquo_basedir}/tomcat/webapps/bpm-async/ %{SOURCE0}
cp  %{SOURCE1} $RPM_BUILD_ROOT/%{abiquo_basedir}/scripts
cp  %{SOURCE2} $RPM_BUILD_ROOT/%{abiquo_basedir}/scripts
cp  %{SOURCE4} $RPM_BUILD_ROOT/%{abiquo_basedir}/scripts
cp  %{SOURCE5} $RPM_BUILD_ROOT/%{abiquo_basedir}/scripts
cp  %{SOURCE6} $RPM_BUILD_ROOT/%{abiquo_basedir}/scripts
mkdir -p $RPM_BUILD_ROOT/usr/bin/
%{__install} -Dp -m 0755 %{SOURCE1} $RPM_BUILD_ROOT/usr/bin/
%{__install} -Dp -m 0755 %{SOURCE2} $RPM_BUILD_ROOT/usr/bin/
%{__install} -Dp -m 0755 %{SOURCE4} $RPM_BUILD_ROOT/usr/bin/
%{__install} -Dp -m 0755 %{SOURCE5} $RPM_BUILD_ROOT/usr/bin/
%{__install} -Dp -m 0755 %{SOURCE6} $RPM_BUILD_ROOT/usr/bin/
cp %{SOURCE3} $RPM_BUILD_ROOT/%{abiquo_basedir}/config/examples/
mkdir -p $RPM_BUILD_ROOT/%{abiquo_basedir}/v2v-conversions

%clean
rm -rf $RPM_BUILD_ROOT

%post
cp /etc/samba/smb.conf /etc/samba/smb.conf.rpmsave

cat > /etc/samba/smb.conf <<EOF

[global]
workgroup = WORKGROUP
server string = %h server
dns proxy = no
log file = /var/log/samba/log.%m
max log size = 1000
syslog = 0
panic action = /usr/share/samba/panic-action %d
security = share
guest account = root
encrypt passwords = true
passdb backend = tdbsam
obey pam restrictions = yes
unix password sync = yes
passwd program = /usr/bin/passwd %u
passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
pam password change = yes

[vm_repository]
path = /opt/vm_repository
guest ok = yes
read only = false
locking = yes

EOF

%files
%defattr(-,root,root,-)
%{abiquo_basedir}/tomcat/webapps/bpm-async
%{abiquo_basedir}/scripts
/usr/bin/mechadora
/usr/bin/v2v-diskmanager
/usr/bin/export-private
/usr/bin/amz-import
/usr/bin/raw-to-vhdflat
%{abiquo_basedir}/config/examples/abiquo.properties.v2v
%{abiquo_basedir}/v2v-conversions
%config(noreplace) %{abiquo_basedir}/tomcat/webapps/bpm-async/WEB-INF/classes/logback.xml
%{abiquo_basedir}/v2v-conversions


%changelog
* Tue Aug 18 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-3
- Added ec2 tools as dep (sergio.pena+rpmbaker@abiquo.com)

* Mon Aug 10 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-2
- Added public export files (sergio.pena+rpmbaker@abiquo.com)

* Fri Aug 07 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-1
- Bumped to 3.6.0

* Tue Apr 21 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-1
- Bumped 3.4.0 (sergio.pena+rpmbaker@abiquo.com)

* Mon Dec 01 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.3-1.master
- Added Epoch (sergio.pena+rpmbaker@abiquo.com)

* Wed Oct 29 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2-1.master
- Bumped 3.2 (sergio.pena+rpmbaker@abiquo.com)

* Thu Oct 02 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.1.1-1
- New package built with tito
- Bumped version to 3.1.1

* Mon Jul 28 2014 sergio.pena@abiquo.com - 3.1.0-2
- Added conditional nightly build

* Mon Jun 16 2014 Marc Morata <marc.morata@abiquo.com> - 3.1.0-1
- Bumped version to 3.1.0

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.0GA-1
- Bumped version to 3.0.0GA

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com>
- Bumped version to 3.0.0GA

* Thu May 01 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.2-1
- Bumped version to 3.0.2

* Thu Dec 05 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- Bumped version to 3.0.0

* Tue Apr 23 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6.0-2
- Bumped version to 2.6.0

* Wed Dec 05 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.4.0-1
- Bumped version to 2.4.0

* Tue Oct 23 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.3.0-1
- bumped version to 2.3.0

* Fri Aug 31 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2.0-1
- new versioning

* Fri Jun 08 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2-1
- Added new conversions dir. Bumped version to 2.2

* Thu Apr 19 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0-5
- 2.0-HF1 bump

* Wed Mar 14 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0-4
- Adding binary permissions

* Thu Feb 02 2012 Sergio Rubio <srubio@abiquo.com> - 2.0-3
- Added qemu-img dependency

* Tue Jan 31 2012 Sergio Rubio <srubio@abiquo.com> - 2.0-2
- updated mechadora and v2v-diskmanager sources

* Mon Dec 19 2011 Sergio Rubio <srubio@abiquo.com> - 2.0-1
- bumped version to 2.0
- added v2v sample properties file

* Fri Oct 07 2011 Sergio Rubio <srubio@abiquo.com> - 1.8.5-2
- updated v2v-diskmanager script

* Fri Sep 30 2011 Sergio Rubio <srubio@abiquo.com> - 1.8.5-1
- bumped version to 1.8.5

* Wed Jun 15 2011 Sergio Rubio <rubiojr@frameos.org> - 1.8-2
- updated mechadora

* Mon May 30 2011 Sergio Rubio <srubio@abiquo.com> - 1.8-1
- updated to 1.8

* Thu Apr 14 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.6-1
- bumped version

* Thu Mar 17 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.5-1
- version bump
- v2v-diskmanager updated

* Mon Feb 28 2011 Sergio Rubio <rubiojr@frameos.org> - 1.7-8
- set buildarch to noarch

* Wed Feb 16 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-7
- fix release string

* Thu Feb 03 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-6.GA
- upstream fixes

* Mon Jan 31 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-5.GA
- GA build

* Mon Jan 10 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-3
- depend on samba and nfs-utils
- override default smb.conf

* Mon Jan 10 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-3
- use WAR as Source0

* Tue Dec 14 2010 Sergio Rubio <srubio@abiquo.com> - 1.7-2
- updated build system

* Mon Nov 22 2010 Sergio Rubio <srubio@abiquo.com> 1.7-1
- Updated to upstream 1.7

* Tue Oct 05 2010 Sergio Rubio <srubio@abiquo.com> 1.6.8-1
- Updated to upstream 1.6.8

* Thu Sep 16 2010 Sergio Rubio srubio@abiquo.com 1.6.5-2
- replace VirtualBox dep with vboxmanage

* Thu Sep 02 2010 Sergio Rubio srubio@abiquo.com 1.6.5-1
- updated to 1.6.5

* Wed Jul 21 2010 Sergio Rubio srubio@abiquo.com 1.6-3
- Add mechadora and v2v-diskmanager scripts to /usr/bin
- Remove init script

* Fri Jul 09 2010 Sergio Rubio srubio@abiquo.com 1.6-2
- Added buildstamp to the package

* Mon Jul 05 2010 Sergio Rubio srubio@abiquo.com 1.6-1
- Updated to upstream 1.6

* Wed May 26 2010 Sergio Rubio srubio@abiquo.com 1.5.1
- Initial Release
