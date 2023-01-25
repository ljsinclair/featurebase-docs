


# Enable TLS authentication



## Before you begin

INSTALL INCLUDE
* [Add authentication](/docs/community/com-config/com-config-authentication)
* [Add group permissions](/docs/community/com-config/com-config-group-permissions)

## Syntax


## Arguments


## Additional

* When TLS is enabled, the scheme must be explicitly defined as `https` in `featurebase.conf` and in the command-line.

KEY PLEASE!

## Examples





For example, `bind = "featurebase-hostname-or-ip:10101"` must be `bind = "https://featurebase-hostname-or-ip:10101"`.
