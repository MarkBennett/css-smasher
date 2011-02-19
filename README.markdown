CSS Masher
===========

css-masher will analyse your css and remove unnecassary elements like comments and whitespace, without modify the meaning of your stylesheets.

Requirements
-------------

css-masher.js can be used in your application on it's own. You need nodejs installed to run it from the command-line.

Usage
-------

css-masher runs from the command-line

    bin/css-masher input.css

The css is written to stdout, so you may want to pipe it into a file:

    bin/css-masher input.css > output.css

Running the tests
------------------

To run the tests you'll need to install the test dependencies:

    npm install jasmine-node
    npm install jake

You can run the tests using jake:

    jake test
