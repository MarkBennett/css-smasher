parser = require('./parser').parser

_comment = /^\/\*.*\*\//
_blank_line = /\n+/

smash = (raw) ->

  lines = raw.replace(_blank_line, "\n")
  lines = lines.split("\n")
  results = []
  for line in lines
    if _comment.test(line)
      continue
    results.push(line)
  results.join("\n")
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
