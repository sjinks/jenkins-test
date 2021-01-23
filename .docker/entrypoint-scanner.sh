#!/bin/sh

env | sort

/opt/sonar-scanner/bin/sonar-scanner "$@"
