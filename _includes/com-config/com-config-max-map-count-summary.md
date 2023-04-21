Linux systems limit memory maps for processes and users.

The `max-map-count` parameter in the `/featurebase.conf` TOML configuration file allows you to set a maximum limit on active memory maps.

This parameter is disabled by default.

`max-map-count` should be set to a minimum 10% lower than the system default.

{: .note}
The actual number of active memory maps can be slightly higher than defined.
