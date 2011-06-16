parser = require('./parser').parser

smash = (raw) ->
  comment = /^\/\*.*\*\//
  lines = raw.split("\n")
  results = (line for line in lines when !comment.test(line))
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
