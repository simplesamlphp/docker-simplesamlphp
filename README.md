simplesamlphp test environment

This repo sets up a test environment to test simplesamlphp. It creates four services:
 - idp.tutorial.stack-dev.cirrusidentity.com
 - proxy.tutorial.stack-dev.cirrusidentity.com
 - sp1.tutorial.stack-dev.cirrusidentity.com
 - sp2.tutorial.stack-dev.cirrusidentity.com

all available in your browser. proxy and sp1 is setup to use idp as idp, while sp2 uses proxy as idp.

To get started put the release version of simplesamlphp you want to test in a
folder named `simplesamlphp`. You also could clone the recent master branch
into this folder using the following command:

    git clone https://github.com/simplesamlphp/simplesamlphp

Then run `docker-compose up -d`. The
`ca` folder should now contain a `ca.pem` file you can import in your
browser to https access. Then point your browser at
https://sp1.tutorial.stack-dev.cirrusidentity.com or
https://sp2.tutorial.stack-dev.cirrusidentity.com to start testing.

Make sure that all DNS entries are set up correctly if you are
running `docker` on another machine, e.g. within a separate VM.
