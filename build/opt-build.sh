#!/bin/bash

set -xe

if [[ -z "${TMPDIR}" ]]; then
  TMPDIR=/tmp
fi

set -u

rm -rf $TMPDIR/downloads

mkdir -p $TMPDIR/downloads $OPT/bin $OPT/etc $OPT/lib $OPT/share $OPT/site /tmp/hts_cache

cd $TMPDIR/downloads

# vafCorrect
curl -sSL -o distro.zip --retry 10 https://github.com/cancerit/vafCorrect/archive/5.1.2.zip
mkdir $TMPDIR/downloads/distro
bsdtar -C $TMPDIR/downloads/distro --strip-components 1 -xf distro.zip
cd $TMPDIR/downloads/distro
./setup.sh $OPT
rm /tmp/hts_cache
rm -rf $TMPDIR/downloads
