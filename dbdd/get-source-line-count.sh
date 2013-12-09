#!/bin/bash
pushd .. > /dev/null
FILES=$(sort < <(find java -iname "*.java"; echo ddl/Tables.sql; echo test-data/Insertion.sql; echo ddl/conv.sh) )
wc -l $FILES
popd > /dev/null
