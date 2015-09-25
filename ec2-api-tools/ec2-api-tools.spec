%define abiquo_basedir /opt/abiquo

Name:     ec2-api-tools
Version:  1.7.5
Release:  14%{?dist}
Summary:  Amazon EC2 CLI
Group:    Development/System 
License:  Multiple
URL:      http://aws.amazon.com

Source0:  http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
#Requires: abiquo-core
Requires:  unzip

%description
This is the Amazon EC2 Command Line Reference. It provides descriptions, syntax, and usage examples for each of the commands for Amazon EC2 and Amazon Virtual Private Cloud (Amazon VPC). 

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software.

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/opt/aws
unzip %{SOURCE0} -d $RPM_BUILD_ROOT/opt/aws

%clean
rm -rf $RPM_BUILD_ROOT

%post
pushd /opt/aws/*
awspath=$(pwd)
popd

mkdir /etc/sysconfig/abiquo -p
cat << EOF > /etc/sysconfig/abiquo/ec2-api-tools
export EC2_HOME=$awspath
export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin:$EC2_HOME/bin
EOF

%postun
rm /etc/sysconfig/abiquo/ec2-api-tools

%files
%defattr(-,root,root,-)
/opt/aws

%changelog
* Fri Sep 25 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-14
- 

* Fri Sep 25 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-13
- 

* Mon Sep 21 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-12
- Remove Epoch (sergio.pena+rpmbaker@abiquo.com)

* Mon Aug 10 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-11
- modified path

* Mon Aug 10 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-10
- Modified var files to /etc/sysconfig/ec2-api-tools

* Thu Aug 06 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-9
- Fixed profile.d .sh suffix (sergio.pena+rpmbaker@abiquo.com)

* Thu Aug 06 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-8
- Fixed profile.d path (sergio.pena+rpmbaker@abiquo.com)

* Thu Aug 06 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-7
- Fixed files path (sergio.pena+rpmbaker@abiquo.com)

* Thu Aug 06 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-6
- Fixed tools path (sergio.pena+rpmbaker@abiquo.com)

* Wed Aug 05 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-5
- Removed config file (sergio.pena+rpmbaker@abiquo.com)

* Wed Aug 05 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-4
- Fix path /opt (sergio.pena+rpmbaker@abiquo.com)

* Wed Aug 05 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-3
- Added ec2-api-tools.zip (sergio.pena+rpmbaker@abiquo.com)

* Wed Aug 05 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-2
- Added ec2-api-tools symlink

* Wed Aug 05 2015 rpmbaker <sergio.pena+rpmbaker@abiquo.com> 1.7.5-0
- new package built with tito

