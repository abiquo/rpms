%define abiquo_basedir /opt/abiquo

Name:     abiquo-ui
Version:  		%{getenv:ABIQUO_VERSION}
Release:  		%{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}
Summary:  Abiquo User Interface
Group:    Development/System 
License:  Multiple
URL:      http://www.abiquo.com 

Source0:  ../../ui-html-files.zip
Source1:  abiquo.conf
Source2:  abiquo_ssl.conf
Source3:  ssl.conf
Source4:  create_certs.sh

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
Requires:  webserver unzip
BuildArch: noarch

%description
Next Generation Cloud Management Solution

This package contains the user interface component.

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software.

%pre
if [ -d %{_var}/www/html/ui/config/tutorials ]
then
  echo "Found old tutorials directory, backing it up..."
  mv $RPM_BUILD_ROOT%{_var}/www/html/ui/config/tutorials{,.backup}
fi

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{_var}/www/html
unzip %{SOURCE0} -d $RPM_BUILD_ROOT%{_var}/www/html
rmdir $RPM_BUILD_ROOT%{_var}/www/html/ui/config/tutorials
mkdir -p $RPM_BUILD_ROOT%{_docdir}/%{name}
mkdir -p $RPM_BUILD_ROOT%{abiquo_basedir}/tutorials
cp %{SOURCE1} $RPM_BUILD_ROOT%{_docdir}/%{name}/
cp %{SOURCE2} $RPM_BUILD_ROOT%{_docdir}/%{name}/
cp %{SOURCE3} $RPM_BUILD_ROOT%{_docdir}/%{name}/
%{__install} -Dp -m 0755 %{SOURCE4} $RPM_BUILD_ROOT%{_docdir}/%{name}/


# Install tutorials
ln -sf %{abiquo_basedir}/tutorials %{buildroot}%{_var}/www/html/ui/config/tutorials

%clean
rm -rf $RPM_BUILD_ROOT

%post


%files
%defattr(-,root,root,-)
%{_var}/www/html/*
%{_docdir}/%{name}
%config(noreplace) /var/www/html/ui/config/tutorials
%config(noreplace) /var/www/html/ui/config/client-config-custom.json
%config(noreplace) /var/www/html/ui/lang/lang_??_??_custom.json
%config(noreplace) /var/www/html/ui/externaljsloadertemplate.html

%changelog
* Mon Aug 10 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-3
- No replace of the remote access

* Mon Aug 10 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-2
- Added config noreplace to remoteaccess (sergio.pena+rpmbaker@abiquo.com)

* Fri Aug 07 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-1
- Bumped to 3.6.0

* Tue May 12 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-3
- Added FollowSymLinks on ssl configuration

* Thu Apr 30 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-2
- Added apache dependency (sergio.pena+rpmbaker@abiquo.com)

* Tue Apr 21 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-1
- Bumped 3.4.0 (sergio.pena+rpmbaker@abiquo.com)

* Mon Feb 23 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4-2.master
- Added branch env variable remove tutos (sergio.pena+rpmbaker@abiquo.com)

* Mon Jan 19 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4-1.master
- Bump to 3.4

* Mon Dec 01 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.3-1.master
- Automatic commit of package [abiquo-ui] release [3.2.1-1.master].
  (sergio.pena+rpmbaker@abiquo.com)
- Added Epoch (sergio.pena+rpmbaker@abiquo.com)

* Mon Dec 01 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2.1-1.master
- Added Epoch (sergio.pena+rpmbaker@abiquo.com)

* Thu Nov 13 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2.0-3
- Removed sylink, set tutorials to not be overwritten on upgrades
  (sergio.pena+rpmbaker@abiquo.com)

* Thu Nov 13 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2.0-2
- Added tutorials to the rpm (sergio.pena+rpmbaker@abiquo.com)

* Fri Oct 31 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2.0-1
- Bumped 3.2.0 (sergio.pena+rpmbaker@abiquo.com)

* Mon Oct 20 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2.0-0
- Bumped to 3.2.0 (sergio.pena+rpmbaker@abiquo.com)
- http://jira.abiquo.com/browse/ABICLOUDPREMIUM-7642
  (sergio.pena+rpmbaker@abiquo.com)

* Wed Oct 01 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.1.0-3
- new package built with tito

* Mon Jul 28 2014 sergio.pena@abiquo.com - 3.1.0-3
- Removed motd

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

* Tue Mar 25 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.0-4
- Saving new config as rpmnew

* Mon Dec 16 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-3
- Added conf files

* Thu Dec 12 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-2
- Added MOTD

* Thu Dec 05 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- First 3.0.0 release.


