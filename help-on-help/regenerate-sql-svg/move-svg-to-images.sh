#!/bin/bash
echo moving all .svg files from /help-on-help to /assets/images/sql-guide
cd ..
mv *.svg ~/featurebase-docs/assets/images/sql-guide
echo Move complete. See results in /assets/images/sql-guide
