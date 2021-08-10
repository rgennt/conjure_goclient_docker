#!/bin/sh

ORIGINAL_ASSETS=/gotapdance/original_assets
ASSETS_PATH=/gotapdance/assets

if [ ! -s ${ASSETS_PATH}/ClientConf ];
then
  cp ${ORIGINAL_ASSETS}/ClientConf ${ASSETS_PATH}/ClientConf
fi

if [ ! -s ${ASSETS_PATH}/station_pubkey_test ];
then
  cp ${ORIGINAL_ASSETS}/station_pubkey_test ${ASSETS_PATH}/station_pubkey_test
fi

if [ ! -s ${ASSETS_PATH}/clientconf ];
then
  cp /gotapdance/clientconf ${ASSETS_PATH}/clientconf
fi

exec "$@"
