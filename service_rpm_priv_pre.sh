{{=<% %>=}}#!/bin/sh

# heavily inspired by node_package hooks
package_service_name={{package_service_name}}
package_service_user={{package_service_user}}
package_service_group={{package_service_group}}
package_service_user_description="{{package_service_user_description}}"

# add a group
if ! getent group ${package_service_group} >/dev/null 2>&1; then
  groupadd -r ${package_service_group}
fi

# and a user
if getent passwd ${package_service_user} >/dev/null 2>&1; then
  usermod -d /var/run/${package_service_name} ${package_service_user}
else
  useradd -r -g ${package_service_group} \
          --home /var/run/${package_service_name} \
          --comment "${package_service_user_description}" \
          --shell /bin/bash \
          ${package_service_user}
fi
<%={{ }}=%>
