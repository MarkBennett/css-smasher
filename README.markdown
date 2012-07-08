CSS Masher
===========

css-masher will analyse your css and remove unnecassary elements like comments and whitespace, without modify the meaning of your stylesheets.

Requirements
-------------

css-masher.js can be used in your application or on it's own. You need nodejs installed to run it from the command-line.

Installation
--------------

    npm install css-smasher

If you've checked out the Git repo to do development install development dependencies with:

    cd css-smasher
    npm install --dev

Usage
-------

Once installed with npm css-masher runs from the command-line:

    css-smash input.css

The css is written to stdout, so you may want to pipe it into a file:

    css-smash input.css > output.css

You can also use the --outfile parameter:

    css-smash --outfile output.css input.css

For full usage do:

     css-smash --usage

Development
-------------

When developing, here are a few things you should know...

 1. The parser is built from the parser.jison file using "cake build:parser"
 2. To update your javascript as you're changing the coffeescript use
    "cake build:watch"


Running the tests
------------------

To run the tests you'll need to install the test dependencies (see Installation), then:

     cake spec

If your tests are failing you should consider running "cake build" to update
all dependencies. You can use "cake build:watch" to rebuild while you work.
