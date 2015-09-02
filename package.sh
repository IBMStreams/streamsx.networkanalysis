#!/bin/bash

## Copyright (C) 2015  International Business Machines Corporation
## All Rights Reserved

here=$( cd ${0%/*} ; pwd )

die() { echo ; echo -e "\033[1;31m$*\033[0m" >&2 ; echo "//////////////////////////////////////////////////////////////////////" ; exit 1 ; }
step() { echo ; echo -e "\033[1m$*\033[0m" ; }

################################################################################

date=$( date +%Y-%m-%d )
package=$HOME/streamsx.network.toolkit\_$date.tar.gz

cd $here || die "sorry, could not change to directory '$here', $?"

[ -f $package ] && rm $package

step "creating package $package ..."
tar -cvzf $package \
--exclude='*~' \
--exclude='#*#' \
--exclude='output/*' \
--exclude='.svn' \
--exclude='.git' \
--exclude='StreamsLogsJob*.tgz' \
--exclude='.metadata' \
--exclude='.tempLaunch' \
--exclude='*.splbuild' \
--exclude='*_cpp.pm' \
--exclude='*_h.pm' \
--exclude='debug.*' \
--exclude='.DS_Store' \
$here \
|| die "Sorry, could not create package $package, $?"
step "created package $package"

exit 0
