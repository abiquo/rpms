%define abiquo_basedir /opt/abiquo

Name:     abiquo-tutorials
Version:  %{getenv:ABIQUO_VERSION}
Release:  %{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}
Summary:  Abiquo User Interface Tutorials
Group:    Development/System
License:  Multiple
URL:      http://www.abiquo.com
Source0:  ../../tutorials-bundle.zip

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
Requires:  webserver unzip abiquo-ui
BuildArch: noarch

%description
Next Generation Cloud Management Solution

This package contains the user interface tutorials component.

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software.


%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{abiquo_basedir}
unzip %{SOURCE0} -d $RPM_BUILD_ROOT%{abiquo_basedir}

%clean
rm -rf $RPM_BUILD_ROOT

%post


%files
%defattr(-,root,root,-)
%{abiquo_basedir}/tutorials/*

%changelog
* Thu Aug 13 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-2
- Added file tutorials bundle (sergio.pena+rpmbaker@abiquo.com)

* Thu Aug 13 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6.0-1
- Removed SNAPSHOT from path (sergio.pena+rpmbaker@abiquo.com)

* Wed Aug 12 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.6-.master
- Tutorial build for master (sergio.pena+rpmbaker@abiquo.com)

* Thu Apr 30 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-2
- Removed bundle from source (sergio.pena+rpmbaker@abiquo.com)

* Tue Apr 21 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.4.0-1
- Bumped to 3.4.0 (sergio.pena+rpmbaker@abiquo.com)

* Fri Feb 06 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2.0-2
- Added zipfile (sergio.pena+rpmbaker@abiquo.com)
- removed specfile with wrong name (sergio.pena+rpmbaker@abiquo.com)

* Fri Feb 06 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com>
- Added zipfile (sergio.pena+rpmbaker@abiquo.com)
- removed specfile with wrong name (sergio.pena+rpmbaker@abiquo.com)

* Fri Feb 06 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 3.2.0-1
- New package build for abiquo-tutorials

