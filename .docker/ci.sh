#!/bin/sh

set -x
[ -d /app/coverage-report ] && chmod 0777 /app/coverage-report
vendor/bin/phpunit --coverage-clover /app/coverage-report/clover.xml --log-junit /app/coverage-report/junit.xml
