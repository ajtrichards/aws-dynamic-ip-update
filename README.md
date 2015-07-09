aws-dynamic-ip-update
=====================

A shell script that will fetch your current IP address from the http://checkip.amazonaws.com service and adds your IP to each of the security groups in your AWS Zone

##### Requires

  - Curl
  - AWS command line tools - available from http://aws.amazon.com/cli/
  - An acceptable flavour of Linux or OSX... i.e not Windows..

Version
----

1.0

Installation
--------------

```sh
git clone https://github.com/ajtrichards/aws-dynamic-ip-update.git
cd aws-dynamic-ip-update
./update.sh
```

NOTE: Before running the script you will need to ensure that your AWS CLI is configured with your Key, Secret and Default Region.

License
----

MIT
