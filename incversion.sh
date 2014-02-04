PREVVER='2.6.0'
POSTVER='3.0.0'
cd $1
# Change version
sed -i "/Version:/s/$PREVVER/$POSTVER/g" $1.spec
# Reset release
sed -i "/Release:/s/[0-9]/0/g" $1.spec
rpmdev-bumpspec -c "Bumped version to $POSTVER" *.spec
