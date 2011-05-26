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
  addComment: (raw) ->
    @lines.push raw
  addRule: (ruleset) ->
    @lines.push ruleset
  lines: ->
    @lines
exports.Stylesheet = Stylesheet

class Ruleset
  constructor: (selector, declerations) ->
    @selector = selector
    @declerations = declerations
exports.Ruleset = Ruleset

parse = (raw) ->
  parser.yy.Stylesheet = Stylesheet
  parser.yy.Ruleset = Ruleset
  parser.parse(raw)

exports.parse = parse
exports.parser = parser
