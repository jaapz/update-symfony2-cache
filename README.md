Symfony2 Cache/Assets Script
============================

This script automates the rebuilding of the cache and assets of a Symfony2
application. I started calling these commands way to much so I made a script out
of it.

Usage
-----

I recommend putting this in the `bin/` directory of your application.

In development, run:

    bin/update-cache.sh


To use this in production, run:

    bin/update-cache.sh --prod
