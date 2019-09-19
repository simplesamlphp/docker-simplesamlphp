#!/bin/bash
set -e
set -o pipefail

if ! test -f ca/ca.pem
then
    cfssl gencert -initca ca/ca.json |cfssljson -bare ca/ca
fi
if ! test -f nginx/cert.pem
then
    cfssl gencert -ca ca/ca.pem -ca-key ca/ca-key.pem ca/cert.json |cfssljson -bare nginx/cert
fi
