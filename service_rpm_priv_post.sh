{{=<% %>=}}#!/bin/sh

# In the RPM scriptlets the $1 argument is 0 if the RPM is being
# removed, 1 if it is being installed, and >= 2 if it is being
# upgraded.

# heavily inspired by node_package hooks
package_service_name={{package_service_name}}
package_service_user={{package_service_user}}
package_service_group={{package_service_group}}

# in case user/group ids have changed for some reason, force permission changes
# on the home and log directories (as those are currently forced to the given
# user
chown -R ${package_service_user}:${package_service_group} /var/run/${package_service_name}
chown -R ${package_service_user}:${package_service_group} /var/log/${package_service_name}
<%={{ }}=%>
