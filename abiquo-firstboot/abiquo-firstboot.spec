name:           abiquo-firstboot
Version:        %{getenv:ABIQUO_VERSION}
Release:        %{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}
Url:            http://www.abiquo.com
License:        Multiple
Group:          Development/Tools
Summary:        Abiquo first boot configuration tool.
Source0:        abiquo-firstboot.py
Source1:        abiquo-firstboot.init
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch
Requires:       dialog, python-setuptools, augeas
BuildRequires:  python-setuptools

%description
Abiquo is the Next Generation Cloud Management Solution

This package includes a script to configure needed properties before first start.

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software

%prep
rm -rf $RPM_BUILD_ROOT

%clean
rm -rf $RPM_BUILD_ROOT

%install
mkdir -p $RPM_BUILD_ROOT%{_sysconfdir}/rc.d/init.d/
mkdir -p $RPM_BUILD_ROOT%{_sbindir}
mkdir -p $RPM_BUILD_ROOT%{_docdir}/%{name}
install -m 755 %{SOURCE0} $RPM_BUILD_ROOT%{_sbindir}/%{name}
install -m 755 %{SOURCE1} $RPM_BUILD_ROOT%{_sysconfdir}/rc.d/init.d/%{name}
/usr/bin/easy_install rfc3987
/usr/bin/easy_install python-augeas

%pre
/usr/bin/easy_install rfc3987
/usr/bin/easy_install python-augeas

%post
/sbin/chkconfig --add abiquo-firstboot
/sbin/chkconfig abiquo-firstboot on

%preun
/sbin/chkconfig --del abiquo-firstboot

%files
%{_sbindir}/%{name}
%{_sysconfdir}/rc.d/init.d/%{name}

%changelog
* Thu Aug 13 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-1
- Added augeas dependencies (sergio.pena+rpmbaker@abiquo.com)

* Tue Jun 23 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-15
- Now with 100% correct files

* Tue Jun 23 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-14
- Fix for Apache timeouts

* Mon Jun 22 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-13
- Added Augeas for proxy timouts and conditional JCE

* Thu May 28 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-11
- Language corrections

* Tue May 26 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-10
- https://github.com/abiquo/installer-firstboot/pull/10 Fix missing httpd config

* Tue May 26 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-9
- https://github.com/abiquo/installer-firstboot/pull/9 

* Tue May 26 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-8
- Add easy_install to pre (sergio.pena+rpmbaker@abiquo.com)

* Tue May 26 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-7
- Added chkconfig on (sergio.pena+rpmbaker@abiquo.com)

* Fri May 22 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-5
- Added summary screen

* Thu May 21 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-4
- Added azure profiles

* Wed May 20 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-3
- Remove plymouth stuff

* Wed May 20 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-2
- Fixed sources path from github repo

* Wed May 20 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-1
- Change sources to github

* Tue May 19 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-1.master
- Install easy_install and rfc3987 (sergio.pena+rpmbaker@abiquo.com)

* Wed Oct 29 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2-1.master
- Bumped 3.2 (sergio.pena+rpmbaker@abiquo.com)

* Thu Oct 02 2014 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.1.1-1
- New package built with tito
- Bumped version to 3.1.1

* Wed Aug 13 2014 marc.morata@abiquo.com - 3.1.0-3
- Checking download

* Tue Aug 12 2014 marc.morata@abiquo.com - 3.1.0-2
- Added jce download

* Mon Jun 16 2014 Marc Morata <marc.morata@abiquo.com> - 3.1.0-1
- Bumped version to 3.1.0

* Mon Jun 09 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.0GA-3
- New version of the script

* Fri May 30 2014 Marc Morata <marc.morata@abiquo.com> - 3.0.0GA-2
- New version of the script

* Thu May 29 2014 Marc Morata <marc.morata@abiquo.com>
- Bumped version to 3.0.0GA

* Wed Dec 18 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-4
- Removed dialog rc

* Thu Dec 05 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-3
- Moved to python  based.

* Wed Oct 16 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-2
- Added abiquo-dialog.rc

* Tue Oct 15 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- Initial release.

