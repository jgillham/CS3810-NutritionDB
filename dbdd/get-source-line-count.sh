#!/bin/bash
pushd prj.link > /dev/null
wc -l `find . -iname "*.java"`
popd > /dev/null
