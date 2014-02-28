Name: liquibase
Summary: Database Refactoring Tool
Version: 3.1.1
Release: 1%{?dist}.abiquo
License: ASL 2.0
Group: Applications/Databases

# Liquibase does not distribute source releases. To generate:
#   git clone https://github.com/liquibase/liquibase.git
#   cd liquibase/
#   git archive --format=tar.gz --prefix=liquibase-3.1.1/ liquibase-parent-3.1.1 liquibase-core/ changelog.txt LICENSE.txt pom.xml > liquibase-3.1.1.tar.gz
Source0: http://mirror.abiquo.com/sources/%{name}-%{version}.tar.gz
Source1: build.xml

BuildRequires: jdk
BuildRequires: jpackage-utils
%if 0%{?rhel} && 0%{?rhel} <= 6
BuildRequires: servlet25
%else
BuildRequires: servlet3
%endif
BuildRequires: ant >= 0:1.7.0

Requires: jdk
Requires: jpackage-utils

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-buildroot
BuildArch: noarch
Url: http://liquibase.org/

%description
LiquiBase is an open source (Apache 2.0 License), database-independent library
for tracking, managing and applying database changes. It is built on a simple
premise: All database changes are stored in a human readable but tracked in
source control.

%package javadoc
Group: Documentation
Summary: API documentation for %{name}

%description javadoc
This package contains %{summary}.

%prep
%setup -q
cp -p %SOURCE1 %{name}-core/

# Remove the Spring wrapper; this is not available as a build dependency:
rm %{name}-core/src/main/java/liquibase/integration/spring/SpringLiquibase.java
rm %{name}-core/src/main/java/liquibase/integration/spring/MultiTenantSpringLiquibase.java

# Liquibase requires snakeyaml which is not available in EPEL.
rm %{name}-core/src/main/java/liquibase/parser/core/yaml/YamlChangeLogParser.java
rm %{name}-core/src/main/java/liquibase/parser/core/json/JsonChangeLogParser.java
rm %{name}-core/src/main/java/liquibase/serializer/core/yaml/YamlChangeLogSerializer.java
rm %{name}-core/src/main/java/liquibase/serializer/core/json/JsonChangeLogSerializer.java

%{__mkdir} -p %{name}-core/lib
build-jar-repository -s -p %{name}-core/lib ant servlet

%build
ant -f %{name}-core/build.xml clean package javadoc

%install
rm -rf %{buildroot}
%{__mkdir} -p %{buildroot}%{_bindir}
%{__install} -d -m 755 %{buildroot}%{_javadir}/%{name}
%{__install} -m 0644 -D -p %{name}-core/dist/lib/%{name}.jar %{buildroot}%{_javadir}/%{name}/%{name}-core.jar
pushd %{buildroot}%{_javadir}
ln -sf %{name}/%{name}-core.jar %{name}.jar
popd
%jpackage_script liquibase.integration.commandline.Main "" "" %{name} %{name} true

# javadoc
%{__install} -d -m 755 %{buildroot}%{_javadocdir}/%{name}
cp -rp %{name}-core/dist/javadoc %{buildroot}%{_javadocdir}/%{name}

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root)
%doc changelog.txt LICENSE.txt
%dir %{_javadir}/%{name}
%{_javadir}/%{name}/%{name}-core.jar
%{_javadir}/%{name}.jar
%{_bindir}/%{name}

%files javadoc
%doc LICENSE.txt
%{_javadocdir}/%{name}

%changelog
* Fri Feb 14 2014 Abel Boldú <abel.boldu@abiquo.com> - 3.1.1-1.abiquo
- Updated version to 3.1.1

* Mon Jan 13 2014 Alex Wood <awood@redhat.com> 3.1.0-1
- Update to 3.1.0

* Mon Oct 28 2013 Alex Wood <awood@redhat.com> - 3.0.7-4
- Update to 3.0.7.
- Use jpackage-utils to generate launch script.
- Split javadoc into separate package.

* Sat Aug 03 2013 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 2.0.5-3
- Rebuilt for https://fedoraproject.org/wiki/Fedora_20_Mass_Rebuild

* Wed Apr 17 2013 Alex Wood <awood@redhat.com> 2.0.5-2
- Build now requires servlet3 instead of servlet25.

* Wed Apr 03 2013 Alex Wood <awood@redhat.com> 2.0.5-1
- Updating to liquibase 2.0.5.

* Thu Feb 14 2013 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 2.0.3-9
- Rebuilt for https://fedoraproject.org/wiki/Fedora_19_Mass_Rebuild

* Thu Jul 19 2012 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 2.0.3-8
- Rebuilt for https://fedoraproject.org/wiki/Fedora_18_Mass_Rebuild

* Thu May 03 2012 Devan Goodwin <dgoodwin@rm-rf.ca> 2.0.3-7
- 818510: Fix offline failures looking for dbchangelog XSD.
  (dgoodwin@redhat.com)

* Mon Apr 16 2012 Devan Goodwin <dgoodwin@rm-rf.ca> 2.0.3-6
- Generate and package javadocs.
- Cleanup rpmlint warnings.
- Switched to using javadir macro.
- Switched to using build-classpath in launcher.
* Tue Apr 03 2012 Devan Goodwin <dgoodwin@rm-rf.ca> 2.0.3-5
- Spec cleanup. (dgoodwin@redhat.com)

* Mon Apr 02 2012 Devan Goodwin <dgoodwin@rm-rf.ca> 2.0.3-4
- Fix missing javax.servlet during compile. (dgoodwin@redhat.com)

* Fri Mar 30 2012 Devan Goodwin <dgoodwin@rm-rf.ca> 2.0.3-3
- Include documentation, better tar.gz generation. (dgoodwin@redhat.com)
- Add custom launcher script. (dgoodwin@redhat.com)
- Add build.xml to compile. (dgoodwin@redhat.com)

* Thu Mar 29 2012 Devan Goodwin <dgoodwin@redhat.com> 2.0.3-2
- Initial packaging attempt.


