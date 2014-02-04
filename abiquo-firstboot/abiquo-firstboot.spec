Name:           abiquo-firstboot
Version:        3.0.0
Release:      	4%{?dist}
Url:            http://www.abiquo.com
License:        Multiple
Group:          Development/Tools
Summary:        Abiquo first boot configuration tool.
Source0:        %{name}.py
Source1:        %{name}.init
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch
Requires:       dialog

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

%post
/sbin/chkconfig --add abiquo-firstboot

%preun
/sbin/chkconfig --del abiquo-firstboot

%files
%{_sbindir}/%{name}
%{_sysconfdir}/rc.d/init.d/%{name}

%changelog
* Wed Dec 18 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-4
- Removed dialog rc

* Thu Dec 05 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-3
- Moved to python  based.

* Wed Oct 16 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-2
- Added abiquo-dialog.rc

* Tue Oct 15 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- Initial release.

