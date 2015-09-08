Name: abiquo-release-ee
Version:  %{getenv:ABIQUO_VERSION}
Release:  %{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}
Summary:  Abiquo release repositories
License:  Multiple
Group: 	  System Environment/Base

Source:   RPM-GPG-KEY-Abiquo
Source1:  abiquo-release
Source2:  abiquo-base.repo
Source3:  abiquo-updates.repo
Source4:  RPM-GPG-KEY-MariaDB
Source5:  RPM-GPG-KEY-RabbitMQ
Source6:  RPM-GPG-RSA-KEY-Abiquo

BuildRoot: %{_tmppath}/abiquo-release-root
BuildArch: noarch

%description
Abiquo release files

%prep
%setup -q -c -T 

%install
rm -rf $RPM_BUILD_ROOT

# create /etc
mkdir -p $RPM_BUILD_ROOT/etc

#GPG
install -Dpm 644 %{SOURCE0} \
    $RPM_BUILD_ROOT%{_sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-Abiquo
install -Dpm 644 %{SOURCE4} \
    $RPM_BUILD_ROOT%{_sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-MariaDB
install -Dpm 644 %{SOURCE5} \
    $RPM_BUILD_ROOT%{_sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-RabbitMQ
install -Dpm 644 %{SOURCE6} \
    $RPM_BUILD_ROOT%{_sysconfdir}/pki/rpm-gpg/RPM-GPG-RSA-KEY-Abiquo

# YUM repos
install -dm 755 $RPM_BUILD_ROOT%{_sysconfdir}/yum.repos.d
install -pm 644 %{SOURCE2} \
    $RPM_BUILD_ROOT%{_sysconfdir}/yum.repos.d
install -pm 644 %{SOURCE3} \
    $RPM_BUILD_ROOT%{_sysconfdir}/yum.repos.d

cp %{SOURCE1} $RPM_BUILD_ROOT/etc/

%post

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%config /etc/yum.repos.d/*
/etc/pki/rpm-gpg/*
/etc/abiquo-release

%changelog
* Mon Sep 08 2015 sergio.pena@abiquo.com 3.6.0
- Merged specs from tito builds

* Tue Apr 21 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-1
- Bumped 3.4.0 (sergio.pena+rpmbaker@abiquo.com)

* Mon Feb 23 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-2.master
- Added branch env variable (sergio.pena+rpmbaker@abiquo.com)

* Mon Jan 19 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com>
- Bump to 3.4

* Mon Dec 01 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.3.0-1.master
- merge (sergio.pena+rpmbaker@abiquo.com)
- Automatic commit of package [abiquo-release-ee] release [3.1.1-1].
  (sergio.pena+rpmbaker@abiquo.com)
- Commited GPG files symlinks (sergio.pena+rpmbaker@abiquo.com)
- Fixed version (sergio.pena+rpmbaker@abiquo.com)
- Added MariaDB and RabbitMQ packages (sergio.pena+rpmbaker@abiquo.com)

* Fri Oct 31 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2.0-1
- Bumped 3.2.0 (sergio.pena+rpmbaker@abiquo.com)

* Wed Oct 01 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.1.0-2
- new package built with tito

* Wed Jul 30 2014 sergio.pena@abiquo.com - 13:3.1.0-2
- Removed files and dependences from rh release, removed issue files and CentOS
  repos

* Mon Jun 16 2014 Marc Morata <marc.morata@abiquo.com> - 13:3.0.0GA-1
- Bumped version to 3.1.0

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com> - 13:3.0.0GA-1
- Bumped version to 3.0.0GA

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com> - 13:3.0.0GA-1
- Bumped version to 3.0.0GA

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com> - 13:3.0.0GA-1
- Bumped version to 3.0.0GA

* Thu May 01 2014 Marc Morata <marc.morata@abiquo.com> - 13:3.0.1-1
- Bumped version to 3.0.2

* Mon Oct 14 2013 Abel Boldú <abel.boldu@abiquo.com> - 13:3.0.0-4
- Added CentOS GPG pubkey.

* Thu Aug 15 2013 Abel Boldú <abel.boldu@abiquo.com> - 13:3.0.0-3
- Added codename.

* Thu Aug 15 2013 Abel Boldú <abel.boldu@abiquo.com> - 13:3.0.0-2
- Symlinks fixed.

* Fri Jul 19 2013 Abel Boldú <abel.boldu@abiquo.com>
- Changed version to 3.0

* Wed Jul 17 2013 Abel Boldú <abel.boldu@abiquo.com> - 13:2.6.0-2
- Provides and obsoletes.

* Tue Jun 25 2013 Abel Boldú <abel.boldu@abiquo.com> - 13:2.6.0-1
- Changed version to 2.6

* Wed Jan 30 2013 Abel Boldú <abel.boldu@abiquo.com> - 13:2.4.0-2
- First EL6 release

