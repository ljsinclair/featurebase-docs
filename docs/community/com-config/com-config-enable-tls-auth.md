


# Enable TLS authentication

TLS authentication is a requirement when setting up FeatureBase authentication

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





For example, `bind = "localhost:10101"` must be `bind = "https://localhost:10101"`.
