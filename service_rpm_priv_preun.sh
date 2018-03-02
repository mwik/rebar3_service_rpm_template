{{=<% %>=}}#!/bin/sh

# heavily inspired by node_package hooks
package_service_name={{package_service_name}}

# only stop service on uninstall, not on upgrades
if [ "$1" = 0 ] ; then
  /sbin/service ${package_service_name} stop
  /sbin/chkconfig --del ${package_service_name}
  epmd_pid=$(ps ax | grep epmd | grep -E "{{package_service_name}}" | grep -v grep | awk '{print $1}')
  if [ -n "$epmd_pid" ] ; then
    kill $epmd_pid
  fi
fi

exit 0
<%={{ }}=%>
