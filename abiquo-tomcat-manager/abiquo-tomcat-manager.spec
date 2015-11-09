%define abiquo_basedir /opt/abiquo

Name:			abiquo-tomcat-manager
Version:		%{getenv:ABIQUO_VERSION}
Release:		%{getenv:ABIQUO_RELEASE}%{?dist}
License:        	Multiple
Group:          	Development/Tools
Summary:        	Abiquo Server Tomcat manager package
Source0:        	http://mirror.abiquo.com/sources/manager_7.0.59.tgz
BuildRoot:      	%{_tmppath}/%{name}-%{version}-build
BuildArch:		noarch

Requires:		abiquo-core, xmlstarlet

%description
Abiquo is the Next Generation Cloud Management Solution

This package includes the Apache Tomcat Manager

This package includes software developed by third-party.
Make sure that you read the license agrements in /usr/share/doc/abiquo-core licenses before using this software

%prep
rm -rf $RPM_BUILD_ROOT
%setup -n manager -T  -b 0
#%setup -n %{name}-tomcat-7.0.59 -T -b 0 
#%setup -n %{name}-tomcat-7.0.59 -a 2 -T -D

%clean
rm -rf $RPM_BUILD_ROOT


%install
echo $(pwd)
mkdir -p $RPM_BUILD_ROOT%{abiquo_basedir}/tomcat/webapps/manager
cp -r * $RPM_BUILD_ROOT%{abiquo_basedir}/tomcat/webapps/manager

%post
#Check tomcat admin
UUID=$(uuidgen)
FILECONFIG=/opt/abiquo/tomcat/conf/tomcat-users.xml
xmlstarlet sel -Q -t -c "tomcat-users/user[@roles='manager-gui']" $FILECONFIG
if [ $? -eq 1 ]; then
xmlstarlet ed -P -S -L -s "/tomcat-users" -t elem -n role -v "$UUID" $FILECONFIG
xmlstarlet ed -P -S -L -i "//role[.='$UUID']" -t attr -n "rolename" -v "manager-gui" $FILECONFIG
xmlstarlet ed -P -S -L -u "//role[.='$UUID']" -v '' $FILECONFIG

xmlstarlet ed -P -S -L -s "/tomcat-users" -t elem -n user -v "$UUID" $FILECONFIG
xmlstarlet ed -P -S -L -i "//user[.='$UUID']" -t attr -n "username" -v "admin" $FILECONFIG
xmlstarlet ed -P -S -L -i "//user[.='$UUID']" -t attr -n "password" -v "xabiquo" $FILECONFIG
xmlstarlet ed -P -S -L -i "//user[.='$UUID']" -t attr -n "roles" -v "manager-gui" $FILECONFIG
xmlstarlet ed -P -S -L -u "//user[.='$UUID']" -v '' $FILECONFIG
else
echo "User with role manager-gui already exists"
fi

%files
%{abiquo_basedir}/tomcat/webapps/manager
