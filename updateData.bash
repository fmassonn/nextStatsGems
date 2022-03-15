#!/bin/bash
#
# Arun Rana
# Downloads sea ice concentration OSISAF450 - ftp://osisaf.met.no/reprocessed/ice/conc/v2p0
# More details at http://osisaf.met.no/p/ice/index.html

set -o nounset
set -o errexit

rootdir=$TECLIM_CLIMATE_DATA
outdir=${rootdir}/obs/ice/siconc/OSI-SAF/OSI-450/raw/

yearb=1979
yeare=2015

mkdir -p $outdir

for hemi in nh sh
do
  for month in 01 02 03 04 05 06 07 08 09 10 11 12
  do
    for year in `seq $yearb $yeare`
    do
      echo ""
      wget -nc ftp://osisaf.met.no/reprocessed/ice/conc/v2p0/$year/$month/ice_conc_${hemi}_ease2-250_cdr-v2p0_${year}${month}??1200.nc -P ${outdir}
    done
  done
done

