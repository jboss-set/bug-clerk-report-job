#!/bin/bash

readonly BUGCLERK_VERSION=${BUGCLERK_VERSION:-'0.5.1.Final'}
readonly FILTER_URL=${FILTER_URL:-'https://bugzilla.redhat.com//buglist.cgi?cmdtype=dorem&amp;list_id=3303150&amp;namedcmd=jboss-eap-6.4.z-superset&amp;remaction=run&amp;sharer_id=213224&amp;ctype=csv'}

mvn exec:java "-Dbugclerk.version=${BUGCLERK_VERSION}" "-Dbugclerk.filter.url=${FILTER_URL}"
