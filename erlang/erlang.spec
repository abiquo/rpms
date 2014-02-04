%define upstream_ver R16B
%define upstream_rel 01
# No debug package
%define debug_package %{nil}

Name:		erlang
Version:	%{upstream_ver}
Release:	1%{?dist}.abiquo
Summary:	General-purpose programming language and runtime environment
Group:		Development/Languages
License:	ERPL
URL:		http://www.erlang.org
Source0:	http://www.erlang.org/download/otp_src_%{upstream_ver}%{upstream_rel}.tar.gz
BuildRoot:	%(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
BuildRequires:  lksctp-tools-devel
BuildRequires:  ncurses-devel
BuildRequires:  openssl-devel
BuildRequires:  zlib-devel
BuildRequires:  flex
BuildRequires:  m4

%description
Erlang is a general-purpose programming language and runtime
environment. Erlang has built-in support for concurrency, distribution
and fault tolerance. Erlang is used in several large telecommunication
systems from Ericsson.

%prep
%setup -q -n otp_src_%{upstream_ver}%{upstream_rel}
# We don't want X stuff
touch lib/wx/SKIP


%build
%configure
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT


%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root,-)
%{_bindir}/ct_run
%{_bindir}/dialyzer
%{_bindir}/epmd
%{_bindir}/erl
%{_bindir}/erlc
%{_bindir}/escript
%{_bindir}/run_erl
%{_bindir}/to_erl
%{_bindir}/typer
%{_libdir}/


%changelog
* Tue Jul 09 2013 Abel Boldú <abel.boldu@abiquo.com> - R16B-1.abiquo
- First release.


