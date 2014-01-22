aws-dynamic-ip-update
=====================

A shell script that will fetch your current IP address from the http://checkip.amazonaws.com service and add it to each of your security groups in an AWS Zone

##### Requires

  - Curl
  - AWS command line tools - available from http://aws.amazon.com/cli/
  - An acceptable flavour of Linux or OSX (I've not tried this on Windows - it may work, it may not)

Version
----

1.0

Installation
--------------

```sh
git clone [git-repo-url] aws-dynamic-ip-update
cd aws-dynamic-ip-update

```

Edit the file `update.sh` and change the settings:

 * CONFIG_REGION (Defaults to eu-west-1)
 * CONFIG_PORT (Defaults to 22)

Once your happy with that you can run the script.

```sh
./update.sh
```

License
----

MIT
