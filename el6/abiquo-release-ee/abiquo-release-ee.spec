%define builtin_release_name GA
%define base_release_version 2.6.0
%define builtin_release_variant Enterprise Edition
%define builtin_release_version 2.6
%define real_release_version %{?release_version}%{!?release_version:%{builtin_release_version}}
%define real_release_name %{?release_name}%{!?release_name:%{builtin_release_name}}
%define product_family Abiquo Linux

%define current_arch %{_arch}

Summary: %{product_family} release file
Name: abiquo-release-ee
Epoch: 13
Version: 2.6.0
Release: 1%{?dist}
License: GPL
Group: System Environment/Base
Source: http://mirror.abiquo.com/abiquo/el6/RPM-GPG-KEY-Abiquo
Source1: abiquo-release
Source2: Abiquo-Base.repo
Provides: abiquo-release 
# Requires: abiquo-release-notes

BuildRoot: %{_tmppath}/abiquo-release-root
BuildArch: noarch

%description
%{product_family} release files

%prep
%setup -q -c -T 

%install
rm -rf $RPM_BUILD_ROOT

#GPG
install -Dpm 644 %{SOURCE0} \
    $RPM_BUILD_ROOT%{_sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-Abiquo

# YUM repos
install -dm 755 $RPM_BUILD_ROOT%{_sysconfdir}/yum.repos.d
install -pm 644 %{SOURCE2} \
    $RPM_BUILD_ROOT%{_sysconfdir}/yum.repos.d

cp %{SOURCE1} $RPM_BUILD_ROOT/etc/

%post
#cat /etc/motd.abiquo > /etc/motd
#echo Abiquo Enterprise Edition %{base_release_version} %{real_release_name} >> /etc/motd

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%config /etc/yum.repos.d/*
/etc/pki/rpm-gpg/*
/etc/abiquo-release
#/etc/motd.abiquo

%changelog
* Tue Jun 25 2013 Abel Boldú <abel.boldu@abiquo.com> - 13:2.6.0-1
- Changed version to 2.6

* Wed Jan 30 2013 Abel Boldú <abel.boldu@abiquo.com> - 13:2.4.0-2
- First EL6 release

