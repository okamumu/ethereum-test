#!/bin/bash

mkdir -p ${DATADIR}
cp -f /Genesis.json ${DATADIR}/Genesis.json
sed -i "s~%ChainID%~$ChainID~g" "${DATADIR}/Genesis.json"
geth --datadir ${DATADIR} init ${DATADIR}/Genesis.json
geth --networkid $ChainID --nodiscover --datadir ${DATADIR} console 2>> ${DATADIR}/geth_err.log
