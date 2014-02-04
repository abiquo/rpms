#!/bin/bash
# Abiquo Apache SSL Front-end script.

if [ -z "$OPENSSL" ]; then OPENSSL=openssl; fi

# Generate random password
# PASSPHRASE="pass:"`tr -dc a-z < /dev/urandom | head -c 23 | xargs`
# GENRSA="$OPENSSL genrsa -des3"
HOSTNAME=`hostname`
GENRSA="$OPENSSL genrsa"
REQ="$OPENSSL req -new"
CA="$OPENSSL ca"
X509="$OPENSSL x509"

$OPENSSL rand -out .rnd 8192

#$GENRSA -passout $PASSPHRASE -out ca.key -rand .rnd 1024
$GENRSA -out ca.key -rand .rnd 1024

cat >ca.cfg <<EOT
[ ca ]
default_ca                      = default_db
[ default_db ]
dir                             = .
certs                           = .
new_certs_dir                   = ca.certs
database                        = ca.index
serial                          = ca.serial
RANDFILE                        = .rnd
certificate                     = ca.crt
private_key                     = ca.key
default_days                    = 365
default_crl_days                = 30
default_md                      = md5
preserve                        = no
name_opt                        = ca_default
cert_opt                        = ca_default
unique_subject                  = no
[ server_policy ]
countryName                     = supplied
stateOrProvinceName             = supplied
localityName                    = supplied
organizationName                = supplied
organizationalUnitName          = supplied
commonName                      = supplied
emailAddress                    = supplied
[ server_cert ]
subjectKeyIdentifier            = hash
authorityKeyIdentifier          = keyid:always
extendedKeyUsage                = serverAuth,clientAuth,msSGC,nsSGC
basicConstraints                = critical,CA:false
[ user_policy ]
commonName                      = supplied
emailAddress                    = supplied
[ user_cert ]
subjectAltName                  = email:copy
basicConstraints                = critical,CA:false
authorityKeyIdentifier          = keyid:always
extendedKeyUsage                = clientAuth,emailProtection

[ req ]
default_bits                    = 1024
default_keyfile                 = ca.key
distinguished_name              = default_ca
x509_extensions                 = extensions
string_mask                     = nombstr
req_extensions                  = req_extensions
input_password                  = secret
output_password                 = secret
[ default_ca ]
countryName                     = Country Code
countryName_value               = UK
countryName_min                 = 2
countryName_max                 = 2
stateOrProvinceName             = State Name
stateOrProvinceName_value       = Berkshire
localityName                    = Locality Name
localityName_value              = Bracknell
organizationName                = Organization Name
organizationName_value          = Abiquo
organizationalUnitName          = Organizational Unit Name
organizationalUnitName_value    = Abiquo Enterprise
commonName                      = Common Name
commonName_value                = $HOSTNAME
commonName_max                  = 64
emailAddress                    = Email Address
emailAddress_value              = support@abiquo.com
emailAddress_max                = 40
[ extensions ]
subjectKeyIdentifier            = hash
authorityKeyIdentifier          = keyid:always
basicConstraints                = critical,CA:false
[ req_extensions ]
nsCertType                      = objsign,email,server
EOT

echo "Generating self signed crt"
$REQ -x509 -days 3650 -batch -config ca.cfg -key ca.key -out ca.crt

# Remove config
rm -f ca.cfg

# Move files to correct location
mv -f ca.crt /etc/pki/tls/certs/
mv -f ca.key /etc/pki/tls/private/ca.key


