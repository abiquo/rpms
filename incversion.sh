cd $1
sed 's/Version:  2.4.0/Version:  2.6.0/g' $1.spec > tmp; mv tmp $1.spec
# sed 's/Release:  1/Release:  0/g' $1.spec > tmp; mv tmp $1.spec
rpmdev-bumpspec -c "Bumped version to 2.6.0" *.spec
