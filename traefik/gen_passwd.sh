#! usr/bin/bash
# apache-utils must be installed
echo $(htpasswd -nbB someUserName "somePassword")