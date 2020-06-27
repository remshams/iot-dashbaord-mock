#!/bin/sh
set -e

dartanalyzer bin lib test
dartfmt -n --set-exit-if-changed bin lib test
