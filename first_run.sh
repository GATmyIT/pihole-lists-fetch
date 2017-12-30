#!/bin/bash
#
# Author:   GATmyIT
# Email:    GATmyIT@GATmyIT.com
# Created:	December 30, 2017
# Usage:    fetch_list_updates.sh
# Descrpt:	Fetch Pi-Hole block list content
#
#
#
# The MIT License (MIT)
# 
# Copyright (c) 2017 Gregory Tewksbury
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
mkdir output
verbose='false'
linenum=1
file=blacklist_lists.txt
while getopts 'v' flag; do
  case "${flag}" in
    v) verbose='true' ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done
while read line; do
  url=$(echo $line | cut -f1 -d,)
  out=$(echo $line | cut -f2 -d,)
  if [ $verbose = 'true' ]; then
     echo Line number: $linenum
     set -x
     curl $url -L --output $out
     set +x
     linenum=$((linenum+1))
  else
     curl $url -L --output $out --silent
  fi
done <$file
# Other
date +"%c fetch completed" >> output/run_log.log