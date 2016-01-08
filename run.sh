#!/bin/bash

readonly BUGCLERK_VERSION=${BUGCLERK_VERSION:-'0.7.0.Final'}

readonly BZ_PASSWORD=${BZ_PASSWORD}
readonly BZ_USERNAME=${BZ_USERNAME}

if [ -z "${BZ_PASSWORD}" ]; then
  echo "Missing Bugzilla Password for user."
  exit 1
fi

readonly FILTER_URL=${FILTER_URL:-'https://bugzilla.redhat.com//buglist.cgi?cmdtype=dorem&amp;list_id=3303150&amp;namedcmd=jboss-eap-6.4.z-superset&amp;remaction=run&amp;sharer_id=213224&amp;ctype=csv'}
readonly REPORT_FILENAME=${REPORT_FILENAME:-'bugclerk-report.html'}

mvn exec:java "-Dbugclerk.version=${BUGCLERK_VERSION}" "-Dbugclerk.filter.url=${FILTER_URL}" "-Dbugclerk.report.filename=${REPORT_FILENAME}" "-Djboss.set.user.password=${BZ_PASSWORD}" "-Djboss.set.user.login=${BZ_USERNAME}"
