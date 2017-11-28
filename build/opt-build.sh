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


SOURCE_EXONERATE="http://ftp.ebi.ac.uk/pub/software/vertebrategenomics/exonerate/exonerate-2.4.0.tar.gz"

CURR_TOOL="exonerate"
CURR_SOURCE=$SOURCE_EXONERATE
cd $TMPDIR/downloads
curl -sSL -o distro.zip --retry 10 $CURR_SOURCE
mkdir $TMPDIR/downloads/exonerate
echo -n "Building exonerate...2.4.0"
bsdtar -C $TMPDIR/downloads/exonerate --strip-components 1 -xf distro.zip
cd $TMPDIR/downloads/exonerate 
./configure --prefix=$OPT 
make -s
make check 
make install

rm -rf /tmp/hts_cache
rm -rf $TMPDIR/downloads
