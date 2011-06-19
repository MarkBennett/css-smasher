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

Running the tests
------------------

To run the tests you'll need to install the test dependencies (see Installation), then:

     cake spec
