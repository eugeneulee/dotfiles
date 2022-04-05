#!/bin/bash
openssl s_client -connect control.akamai.com:443 -servername control.akamai.com 2> /dev/null | openssl x509 -noout -dates notBefore=Nov 17 00:00:00 2020 GMT
