Name:           makeself
Version:        2.2.0
Release:        2%{?dist}
BuildArch:      noarch
Summary:        Make self-extractable archives on Unix
Group:          Development/Tools

License:        GPLv2+
URL:            http://www.megastep.org/makeself/
Source0:        http://github.com/megastep/makeself/archive/release-%{version}.tar.gz
# license file fixed in the master branch
# https://github.com/megastep/makeself/issues/22
Source1:        https://www.gnu.org/licenses/gpl-2.0.txt
# this patch changes the path to makeself-header.sh
# also fixes https://github.com/megastep/makeself/issues/21
Patch0:         makeself_script.patch


%description
makeself.sh is a shell script that generates a self-extractable
tar.gz archive from a directory. The resulting file appears as a shell
script, and can be launched as is. The archive will then uncompress
itself to a temporary directory and an arbitrary command will be
executed (for example an installation script). This is pretty similar
to archives generated with WinZip Self-Extractor in the Windows world.


%prep
%setup -q -n %{name}-release-%{version}
%patch0
cp -fp %{S:1} COPYING


%build
iconv --from-code=ISO-8859-1 --to-code=UTF-8 makeself.1 | gzip > makeself.1.gz


%install
mkdir -p %{buildroot}%{_bindir}
mkdir -p %{buildroot}%{_libexecdir}
mkdir -p %{buildroot}%{_mandir}/man1

install -p -m755 makeself.sh %{buildroot}%{_bindir}/makeself
install -p -m644 makeself-header.sh %{buildroot}%{_libexecdir}
install -p -m644 makeself.1.gz %{buildroot}%{_mandir}/man1/


%files
%doc README.md COPYING
%{_mandir}/man1/*
%{_libexecdir}/*
%{_bindir}/*


%changelog
* Wed Jul 31 2013 Dridi Boukelmoune <dridi.boukelmoune@gmail.com> - 2.2.0-2
- Preserve timestamps during installation

* Sun Jul 07 2013 Dridi Boukelmoune <dridi.boukelmoune@gmail.com> - 2.2.0-1
- GPLv2 license update

* Mon Jun 24 2013 Dridi Boukelmoune <dridi.boukelmoune@gmail.com> - 2.2.0-1
- Initial spec
