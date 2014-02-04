%define builtin_release_name GA
%define base_release_version 3.0.0
%define builtin_release_variant Enterprise Edition
%define builtin_release_version 3.0
%define codename Freeza
%define real_release_version %{?release_version}%{!?release_version:%{builtin_release_version}}
%define real_release_name %{?release_name}%{!?release_name:%{builtin_release_name}}
%define product_family Abiquo Linux

%define current_arch %{_arch}
%define rhel_version 6

Name: abiquo-release-ee
Epoch: 13
Version: %{base_release_version}
Release: 4%{?dist}
Summary: %{product_family} release file
License: GPLv2
Group: System Environment/Base
Source: http://mirror.abiquo.com/abiquo/el6/RPM-GPG-KEY-Abiquo
Source1: abiquo-release
Source2: Abiquo-Base.repo
Source3: http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-6
Obsoletes: rawhide-release redhat-release-as redhat-release-es redhat-release-ws redhat-release-de comps abiquo-release
Obsoletes: rpmdb-redhat redhat-release whitebox-release fedora-release sl-release enterprise-release oraclelinux-release
Obsoletes: centos-release
Provides: abiquo-release centos-release redhat-release system-release yumconf
# Requires: abiquo-release-notes


BuildRoot: %{_tmppath}/abiquo-release-root
BuildArch: noarch

%description
%{product_family} release files

%prep
%setup -q -c -T 

%install
rm -rf $RPM_BUILD_ROOT

# create /etc
mkdir -p $RPM_BUILD_ROOT/etc

#GPG
install -Dpm 644 %{SOURCE0} \
    $RPM_BUILD_ROOT%{_sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-Abiquo
install -Dpm 644 %{SOURCE3} \
    $RPM_BUILD_ROOT%{_sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6


# YUM repos
install -dm 755 $RPM_BUILD_ROOT%{_sysconfdir}/yum.repos.d
install -pm 644 %{SOURCE2} \
    $RPM_BUILD_ROOT%{_sysconfdir}/yum.repos.d

cp %{SOURCE1} $RPM_BUILD_ROOT/etc/
echo "Abiquo release %{builtin_release_version} (%{codename})" > $RPM_BUILD_ROOT/etc/system-release
ln -s system-release $RPM_BUILD_ROOT/etc/redhat-release
echo "cpe:/o:abiquo:linux:%{version}:%{?beta:%{beta}}%{!?beta:GA}" > $RPM_BUILD_ROOT/etc/system-release-cpe

echo Abiquo Enterprise Edition %{base_release_version} %{real_release_name} >> $RPM_BUILD_ROOT/etc/issue
echo "Kernel \r on an \m" >> $RPM_BUILD_ROOT/etc/issue
cp $RPM_BUILD_ROOT/etc/issue $RPM_BUILD_ROOT/etc/issue.net

# set up the dist tag macros
install -d -m 755 $RPM_BUILD_ROOT/etc/rpm
cat >> $RPM_BUILD_ROOT/etc/rpm/macros.dist << EOF
# dist macros.

%%rhel %{rhel_version}
%%dist .el%{rhel_version}
%%el%{rhel_version} 1
EOF


%post


%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%config /etc/yum.repos.d/*
/etc/pki/rpm-gpg/*
/etc/abiquo-release
/etc/system-release
/etc/redhat-release
/etc/rpm/macros.dist
%config %attr(0644,root,root) /etc/system-release-cpe
%config(noreplace) %attr(0644,root,root) /etc/issue
%config(noreplace) %attr(0644,root,root) /etc/issue.net


%changelog
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

