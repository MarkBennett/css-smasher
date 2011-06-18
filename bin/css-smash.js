#!/usr/bin/env node

var css = require("../lib/css"),
    nopt = require("nopt"),
    fs = require("fs"),
    path = require("path"),
    knownOpts = {
      "usage" : Boolean,
      "outfile" : path
    },
    shortHands = {
      "u" : ["--usage"],
      "o" : ["--outfile"]
    },
    usage = "Usage: css-smash [options] <cssfile1> <cssfile2> <cssfile3> ...\n\nThis compresses each of the specified css files and outputs the compressed results. By default css-smash outputs to stdout.\n\nWhere the options are:\n\n\t-o, --outfile\n\t\tFile to output compressed CSS to.\n\n\t-u, --usage\n\t\tDisplays this usage message.\n\nExamples:\n\n\tcss-smash my.css\n\tcss-smash -o smashed.css file1.css file2.css",
    smashed = [],
    parsed = nopt(knownOpts, shortHands, process.argv);

function die(why) {
  console.warn(why, "\n");
  console.warn(usage);
  process.exit(1);
}

if (parsed.usage) {
  console.log(usage);
  process.exit(0);
}

if (!parsed.argv.remain.length) {
  die("No files specified!");
}

function smashFile(file) {
  var data;

  data = fs.readFileSync(file);
  data = data.toString("utf8");
  smashed.push(css.smash(data));
};

parsed.argv.remain.forEach(smashFile);

smashed = smashed.join("\n");

if (parsed.outfile) {
  fs.open(parsed.outfile, "w", function(err, fd) {
    if (err) {
      throw err;
    }
    fs.writeSync(fd, smashed);
  });
} else {
  console.log(smashed);
}
