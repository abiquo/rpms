%define abiquo_basedir /opt/abiquo

Name:           abiquo-server
Version:  		%{getenv:ABIQUO_VERSION}
Release:  		%{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}
Url:            http://www.abiquo.com/
License:        Multiple
Group:          Development/Tools
Summary:        Abiquo Server Enterprise Edition 

Source0:        abiquo.properties.server
Source1:        abiquo-accounting.cron
Source2:		../../database/kinton-schema.sql
Source3:		../../database/liquibase-data.tar.gz
Source4:		abiquo-liquibase
Source5:		00-failed-templates.sh
Source6:    	lqb_update_from_26.sh

BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildRequires:  /usr/bin/unzip
BuildArch: 		noarch

Requires:       abiquo-core abiquo-ui abiquo-m abiquo-api nfs-utils sos wget ruby ntp liquibase 
Requires:       /usr/sbin/sendmail /usr/bin/which

%description
Next Generation Cloud Management Solution

This package contains the server enterprise component.

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software.

%prep

%install
mkdir -p $RPM_BUILD_ROOT/%{_bindir}
mkdir -p $RPM_BUILD_ROOT%{_docdir}/%{name}
mkdir -p $RPM_BUILD_ROOT%{_docdir}/%{name}/database
mkdir -p $RPM_BUILD_ROOT%{_docdir}/%{name}/examples
mkdir -p $RPM_BUILD_ROOT%{abiquo_basedir}
mkdir -p $RPM_BUILD_ROOT/%{abiquo_basedir}/config/examples/
mkdir -p %{buildroot}/%{_sysconfdir}/cron.d/
mkdir -p $RPM_BUILD_ROOT%{_sysconfdir}/profile.d/
cp %{SOURCE2} $RPM_BUILD_ROOT%{_docdir}/%{name}/database/
cp -r %{SOURCE0} $RPM_BUILD_ROOT/%{abiquo_basedir}/config/examples/
cp %{SOURCE1} %{buildroot}/%{_sysconfdir}/cron.d/abiquo-accounting
tar xzf %{SOURCE3} -C $RPM_BUILD_ROOT%{_docdir}/%{name}/database/
cp %{SOURCE5} $RPM_BUILD_ROOT/%{_docdir}/%{name}/database/
cp %{SOURCE4} $RPM_BUILD_ROOT/%{_bindir}/abiquo-liquibase
cp %{SOURCE6} $RPM_BUILD_ROOT/%{_bindir}/lqb_update_from_26.sh

#%post
/bin/chmod +x %{_bindir}/abiquo-liquibase
/bin/chmod +x %{_bindir}/lqb_update_from_26.sh


%clean
rm -rf $RPM_BUILD_ROOT

%files
%{_docdir}/%{name}
%{_sysconfdir}/cron.d/abiquo-accounting
%{abiquo_basedir}/config/examples/abiquo.properties.server
%{_bindir}/abiquo-liquibase
%{_bindir}/lqb_update_from_26.sh

%changelog
* Fri Aug 07 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-1
- Bumped to version 3.6.0

* Wed Jul 29 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.2-1
- Bumped 3.4.2

* Wed May 06 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-9
- abiquo-liquibase get disk controllers from abiquo properties 

* Mon May 04 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-7
- Add redis delta 3.4.0 (sergio.pena+rpmbaker@abiquo.com)

* Thu Apr 30 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-6
- Removed redis dep (sergio.pena+rpmbaker@abiquo.com)

* Mon Apr 27 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-5
- Removed spaces at the end of abiquo-liquibase script

* Sun Apr 26 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-4
- Fixed abiquo-liquibase path (sergio.pena+rpmbaker@abiquo.com)

* Tue Apr 21 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-3
- Changed abiquo-liquibase source (sergio.pena+rpmbaker@abiquo.com)

* Tue Apr 21 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-2
- Fixed war path (sergio.pena+rpmbaker@abiquo.com)

* Tue Apr 21 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-1
- Bumped to 3.4.0 (sergio.pena+rpmbaker@abiquo.com)

* Mon Jan 19 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4-1.master
- Bumped 3.4 (sergio.pena+rpmbaker@abiquo.com)

* Wed Oct 29 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2-1.master
- Bumped 3.2 (sergio.pena+rpmbaker@abiquo.com)

* Thu Oct 02 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.1.1-1
- New package built with tito
- Bumped version to 3.1.1

* Mon Jun 16 2014 Marc Morata <marc.morata@abiquo.com> - 3.1.0-1
- Bumped version to 3.1.0

* Thu Jun 12 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.0GA-3
- Now the lqb update scripts the shows the m user password

* Fri May 30 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.0GA-2
- Modified the changelog for liquibase upgrade

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.0GA-1
- Bumped version to 3.0.0GA

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com>
- Bumped version to 3.0.0GA

* Thu May 01 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.2-1
- Bumped version to 3.0.2

* Fri Feb 14 2014 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-4
- Added liquibase script

* Fri Feb 14 2014 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-3
- Liquibase updates.

* Mon Jan 20 2014 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-2
- Added m and api to deps

* Thu Dec 05 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- Bumped version to 3.0.0

* Tue Jun 18 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6.0-4
- Added redis delta.

* Thu Jun 13 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6.0-3
- New delta naming

* Thu Jun 06 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6.0-2
- Libvirt dependencies removed.

* Tue Apr 23 2013 Abel Boldú <abel.boldu@abiquo.com> - 2.6.0-1
- Bumped version to 2.6.0

* Wed Dec 05 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.4.0-1
- Bumped version to 2.4.0

* Tue Oct 23 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.3.0-1
- bumped version to 2.3.0

* Fri Oct 05 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2.0-2
- Accounting refactor added

* Fri Aug 31 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2.0-1
- new versioning

* Fri Jun 08 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.2-1
- Bumped version to 2.2

* Tue May 29 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0-8
- Added HF3 delta

* Thu May 24 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0-7
- 2.0-HF3 Bump

* Wed Apr 11 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0-6
- update to include 2.0 -> 2.0 HF1 delta

* Fri Mar 16 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0-5
- release bump

* Thu Mar 15 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0-4
- bumped release

* Wed Mar 14 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0-3
- Added redis

* Thu Mar 08 2012 Abel Boldú <abel.boldu@abiquo.com> - 2.0-2
- Added 1.8.5 to 2.0 deltas

* Mon Dec 19 2011 Sergio Rubio <srubio@abiquo.com> - 2.0-1
- bumped version to 2.0

* Fri Nov 18 2011 Sergio Rubio <rubiojr@frameos.org> - 1.8.5-7
- HF4

* Fri Nov 04 2011 Sergio Rubio <srubio@abiquo.com> - 1.8.5-6
- include 1.8.5-HF3 db delta
- update DB schema

* Thu Oct 27 2011 Sergio Rubio <rubiojr@frameos.org> - 1.8.5-5
- abiquo-server.spec

* Mon Oct 10 2011 Sergio Rubio <srubio@abiquo.com> - 1.8.5-4
- updated to include 1.8.5 -> 1.8.5 HF1 delta

* Fri Oct 07 2011 Sergio Rubio <srubio@abiquo.com> - 1.8.5-3
- updated to include 1.8.0 -> 1.8.5 HF1 delta

* Fri Sep 30 2011 Sergio Rubio <srubio@abiquo.com> - 1.8.5-2
- updated delta and schema

* Fri Sep 30 2011 Sergio Rubio <srubio@abiquo.com> - 1.8.5-1
- bumped version to 1.8.5

* Mon Jul 04 2011 Sergio Rubio <rubiojr@frameos.org> - 1.8-2
- added new database delta

* Tue Jun 14 2011 Sergio Rubio <rubiojr@frameos.org> - 1.8-1
- add tomcat default context config

* Fri Apr 15 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.6-2
- fixed install section

* Wed Apr 13 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.6-1
- bumped version

* Tue Apr 05 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.5-4
- readed deltas and schemas
- add ABICLOUDPREMIUM-1464 patches

* Mon Mar 28 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.5-3
- bumped release
- removed abiquo-server-tools dep

* Wed Mar 23 2011 Sergio Rubio <rubiojr@frameos.org> - 1.7.5-2
- bumped release
- 1.7.5 db delta fixed

* Thu Mar 17 2011 Sergio Rubio <srubio@abiquo.com> - 1.7.5-1
- added 1.7.0 to 1.7.5 delta 
- bumped version to 1.7.5

* Wed Feb 16 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-27
- fix release string

* Thu Feb 03 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-26.GA
- upstream fixes

* Mon Jan 31 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-25.GA
- GA build

* Mon Jan 31 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-24
- updated 1.6.8 to 1.7 delta
- updated database schema

* Fri Jan 28 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-23
- updated 1.6.8 to 1.7 delta

* Fri Jan 28 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-22
- updated database schema
- updated 1.6.8 to 1.7 delta

* Thu Jan 27 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-21
- added new premium delta

* Thu Jan 27 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-20
- updated database schema
- updated 1.6.8 to 1.7 delta

* Thu Jan 27 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-19
- updated database schema

* Thu Jan 27 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-18
- updated 1.6.8 to 1.7 delta
- updated database schema

* Wed Jan 26 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-17
- updated 1.6.8 to 1.7 delta

* Wed Jan 26 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-16
- updated 1.6.8 to 1.7 delta

* Wed Jan 26 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-15
- updated database schema

* Mon Jan 24 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-14
- updated database schema

* Mon Jan 24 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-13
- moved properties template to /opt/abiquo/config/examples

* Mon Jan 24 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-12
- fix files section

* Mon Jan 24 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-11
- moved properties template to /usr/share/doc

* Wed Jan 19 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-10
- updated default properties

* Tue Jan 18 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-9
- updated default properties

* Tue Jan 18 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-8
- updated db schema

* Fri Jan 14 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-7
- updated db schema
- updated server properfies template

* Thu Jan 13 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-6
- updated db schema

* Mon Jan 10 2011 Sergio Rubio <srubio@abiquo.com> - 1.7-5
- Use the WAR as Source0

* Mon Dec 20 2010 Sergio Rubio <srubio@abiquo.com> - 1.7-4
- require abiquo-client-premium instead of abiquo-client

* Fri Dec 17 2010 Sergio Rubio <rubiojr@frameos.org> - 1.7-3
- kinton-premium-schema removed

* Tue Dec 14 2010 Sergio Rubio <rubiojr@frameos.org> - 1.7-2
- use the new build system

* Mon Nov 22 2010 Sergio Rubio <srubio@abiquo.com> 1.7-1
- Updated to upstream 1.7

* Fri Nov 05 2010 Sergio Rubio <srubio@abiquo.com> 1.6.8-2
- added accounting cron file

* Tue Oct 05 2010 Sergio Rubio <srubio@abiquo.com> 1.6.8-1
- Updated to upstream 1.6.8

* Tue Sep 14 2010 Sergio Rubio srubio@abiquo.com 1.6.5-2
- removed tools

* Thu Sep 02 2010 Sergio Rubio srubio@abiquo.com 1.6.5-1
- updated to 1.6.5

* Tue Jul 20 2010 Sergio Rubio srubio@abiquo.com 1.6-3
- Removed abiquo-server init script

* Fri Jul 09 2010 Sergio Rubio srubio@abiquo.com 1.6-2
- Added buildstamp to the package

* Mon Jul 05 2010 Sergio Rubio srubio@abiquo.com 1.6-1
- Updated to upstream 1.6

* Tue May 18 2010 Sergio Rubio srubio@abiquo.com 1.5.1-1
- Initial Release
