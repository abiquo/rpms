Name:     abiquo-ui
Version:  3.0.0
Release:  3%{?dist}%{?buildstamp}
Summary:  Abiquo User Interface
Group:    Development/System 
License:  Multiple
URL:      http://www.abiquo.com 
Source0:  %{?abiquo_binaries_url}ui-html-files.zip
Source1:  abiquo.conf
Source2:  abiquo_ssl.conf
Source3:  ssl.conf
Source4:  motd
Source5:  create_certs.sh
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
#Requires: abiquo-core
Requires:  webserver unzip
Obsoletes: abiquo-client-premium
BuildArch: noarch

%description
Next Generation Cloud Management Solution

This package contains the user interface component.

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software.


%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{_var}/www/html
unzip %{SOURCE0} -d $RPM_BUILD_ROOT%{_var}/www/html
mkdir -p $RPM_BUILD_ROOT%{_docdir}/%{name}
cp %{SOURCE1} $RPM_BUILD_ROOT%{_docdir}/%{name}/
cp %{SOURCE2} $RPM_BUILD_ROOT%{_docdir}/%{name}/
cp %{SOURCE3} $RPM_BUILD_ROOT%{_docdir}/%{name}/
%{__install} -Dp -m 0755 %{SOURCE5} $RPM_BUILD_ROOT%{_docdir}/%{name}/

%clean
rm -rf $RPM_BUILD_ROOT

%post
# Add MOTD
cat %{SOURCE4} > $RPM_BUILD_ROOT/etc/rc.d/init.d/motd 


%files
%defattr(-,root,root,-)
%{_var}/www/html/*
%{_docdir}/%{name}

%changelog
* Mon Dec 16 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-3
- Added conf files

* Thu Dec 12 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-2
- Added MOTD

* Thu Dec 05 2013 Abel Boldú <abel.boldu@abiquo.com> - 3.0.0-1
- First 3.0.0 release.


