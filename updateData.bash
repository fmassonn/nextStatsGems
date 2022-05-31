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

# Sea ice Concentration product for OSISAF
# SSMIS Sea Ice Concentration Maps on 10 km Polar Stereographic Grid
# OSI-401-b
# http://osisaf.met.no/p/ice/index.html#conc-ssmis
# http://osisaf.met.no/docs/osisaf_cdop2_ss2_pum_ice-conc_v1p4.pdf
#
# www.osisaf.met.no
#
# Contact: François Massonnet - francois.massonnet@uclouvain.be
#


yearb=2015
yeare=2022
ftype="multi" # multi (= operational, OSI-401b)


outdir=${rootdir}/obs/ice/siconc/OSI-SAF/OSI-401-b/raw

mkdir -p $outdir

#------------------------

for year in `seq $yearb $yeare`
do
  for month in 01 02 03 04 05 06 07 08 09 10 11 12
  do
    rootaddress="ftp://osisaf.met.no/archive/ice/conc/"
    wget -N -c $rootaddress/${year}/${month}/ice_conc_sh_polstere-100_${ftype}_${year}${month}??1200.nc -P $outdir
  done # month
done # year
