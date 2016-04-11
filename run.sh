#!/bin/bash

readonly BUGCLERK_VERSION=${BUGCLERK_VERSION:-'0.8.0-SNAPSHOT'}

readonly TRACKER_PASSWORD=${TRACKER_PASSWORD}
readonly TRACKER_USERNAME=${TRACKER_USERNAME}

readonly TRACKER_TYPE=${TRACKER_TYPE:-'jira'}

if [ -z "${TRACKER_PASSWORD}" ]; then
  echo "Missing Bugzilla Password for user."
  exit 1
fi

readonly EAP7_UNRESOLVED='12326686'
readonly FILTER_URL_ENDPOINT='https://issues.jboss.org/rest/api/latest/filter'
readonly FILTER_URL=${FILTER_URL:-"${FILTER_URL_ENDPOINT}/${EAP7_UNRESOLVED}"}
readonly REPORT_FILENAME=${REPORT_FILENAME:-'bugclerk-report.html'}

mvn exec:java "-Dbugclerk.version=${BUGCLERK_VERSION}" "-Dbugclerk.filter.url=${FILTER_URL}" \
    "-Dbugclerk.report.filename=${REPORT_FILENAME}" "-Djboss.set.user.password=${TRACKER_PASSWORD}" \
    "-Djboss.set.user.login=${TRACKER_USERNAME}" "-Dbugclerk.tracker.type=${TRACKER_TYPE}"
