---
title: Mutual TLS authentication
layout: default
parent: Community configuration
grand_parent: Community
---

# How do I set up mutual TLS authentication?

Mutual TLS allows a client and server to cryptographically verify each other and establish an encrypted connection.

FeatureBase supports Mutual TLS and is configured with a PEM-encoded TLS keypair.

FeatureBase clusters communicate over the Memberlist protocol.

AES-256 symmetric encryption can be enabled on the cluster by configuring a shared 32-bit key on the Memberlist protocol.

{: .note}
Internal `etcd` cluster communication does not currently support TLS.

## Before you begin

* {% include /com-install/com-install-before-begin.md %}
* [Learn how to enable authentication](/docs/community/com-config-auth/com-config-tls-auth)

## Create a testing certificate

{: .important}
CERTSTRAP can be used for testing purposes but is **NOT** recommended for production environments.

### Step 1 - Create a root CA

* Open a CLI and enter the following command

```shell
    certstrap init --common-name "auth.mybusiness.com"
```

### Step 2 - Create and sign a keypair for FeatureBase:

* Run the following command:

```shell
    certstrap request-cert --common-name "featurebase.mybusiness.com"
    certstrap sign featurebase.mybusiness.com --CA auth.mybusiness.com
```

### Step 3 - create a Memberlist 32-bit key

Create a 32-bit key to encrypt Memberlist (gossip) communication:

```shell
    head -c 32 /dev/random > out/gossip.key
```

### Step 4 - verify files have been generated

The following files are generated.

```text
    auth.mybusiness.com.crl
    auth.mybusiness.com.crt
    auth.mybusiness.com.key
    featurebase.mybusiness.com.crt
    featurebase.mybusiness.com.csr
    featurebase.mybusiness.com.key
    gossip.key
```

### Step 5 - Update FeatureBase bind configuration

Update the FeatureBase bind configuration to use the `https` scheme.


```toml
bind = "featurebase-hostname-or-ip:10101"
bind-grpc = "featurebase-hostname-or-ip:10101"
```

## Update FeatureBase configuration

The certificate and private keys can be added to FeatureBase configuration using environment variables, a configuration file or command line parameters.

### Add certificates using environment variables

EXAMPLE GOES HERE

### Add certificates using a `toml` configuration file

```toml
    [tls]
      certificate = "/path/to/featurebase.mybusiness.com.crt"
      key = "/path/to/featurebase.mybusiness.com.key"
```

### Add certificates using command-line parameters

```
  EXAMPLE GOES HERE
```
