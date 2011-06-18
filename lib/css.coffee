parser = require('./parser').parser

_comment = /^\/\*.*\*\//g
_new_line = /\n+/g
_blank_line = /^[ \t\n]*$/
_multi_spaces = /\ +/g

smash = (raw) ->

  lines = raw.replace(_comment, "")
  lines = lines.replace(_new_line, "\n")
  lines = lines.replace(_multi_spaces, " ")
  lines = lines.split("\n")
  results = []
  for line in lines
    if _blank_line.test(line)
      continue
    results.push(line)
  results = results.join("\n")
  results
exports.smash = smash

class Stylesheet
  constructor: ->
    @lines = []
  addLine: (line) ->
    @lines.push line
  lines: ->
    @lines
exports.Stylesheet = Stylesheet

class Ruleset
  constructor: (selectors, declarations) ->
    @selectors = selectors
    @declarations = declarations
exports.Ruleset = Ruleset

class Comment
  constructor: (text) ->
    @text = text
exports.Comment = Comment

parse = (raw) ->
  parser.yy.Stylesheet = Stylesheet
  parser.yy.Ruleset = Ruleset
  parser.yy.Comment = Comment
  parser.parse(raw)

exports.parse = parse
exports.parser = parser
