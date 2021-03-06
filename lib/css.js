// Generated by CoffeeScript 1.3.3
(function() {
  var Comment, Ruleset, Stylesheet, parse, parser, smash, _blank_line, _comment, _multi_spaces, _new_line;

  exports.version = "0.5.0";

  parser = require('./parser').parser;

  _comment = /\/\*.*?[^\\]\*\//g;

  _new_line = /\n+/g;

  _blank_line = /^[ \t\n]*$/;

  _multi_spaces = /[\ \t\n]+/g;

  smash = function(raw) {
    raw = raw.replace(_new_line, " ");
    raw = raw.replace(_comment, "");
    raw = raw.replace(_multi_spaces, " ");
    raw = raw.trim();
    return raw;
  };

  exports.smash = smash;

  Stylesheet = (function() {

    function Stylesheet() {
      this.lines = [];
    }

    Stylesheet.prototype.addLine = function(line) {
      return this.lines.push(line);
    };

    Stylesheet.prototype.lines = function() {
      return this.lines;
    };

    return Stylesheet;

  })();

  exports.Stylesheet = Stylesheet;

  Ruleset = (function() {

    function Ruleset(selectors, declarations) {
      this.selectors = selectors;
      this.declarations = declarations;
    }

    return Ruleset;

  })();

  exports.Ruleset = Ruleset;

  Comment = (function() {

    function Comment(text) {
      this.text = text;
    }

    return Comment;

  })();

  exports.Comment = Comment;

  parse = function(raw) {
    parser.yy.Stylesheet = Stylesheet;
    parser.yy.Ruleset = Ruleset;
    parser.yy.Comment = Comment;
    return parser.parse(raw);
  };

  exports.parse = parse;

  exports.parser = parser;

}).call(this);
