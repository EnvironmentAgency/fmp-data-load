#!/bin/bash

echo Loading Flood Zone 3 into database

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}FMfP_portal_${FMP_FILE_VERSION}.gdb -nln ${FMP_DB_SCHEMA}.floodzone_3 nat_floodzone3_${FMP_FILE_VERSION}_5k_portal -overwrite -progress --config PG_USE_COPY YES -nlt PROMOTE_TO_MULTI -lco SPATIAL_INDEX=${FMP_GENERATE_SPATIAL_INDEX} --config SPATIAL_INDEX NO -sql "SELECT fid_nat_fl,layer,type,fid_os_5km,name FROM nat_floodzone3_${FMP_FILE_VERSION}_5k_portal" -lco GEOMETRY_NAME=wkb_geometry

echo Finished loading Flood Zone 3

exit 0
