exports.version = "0.5.0"

parser = require('./parser').parser
_comment = /\/\*.*?[^\\]\*\//g
_new_line = /\n+/g
_blank_line = /^[ \t\n]*$/
_multi_spaces = /[\ \t\n]+/g

smash = (raw) ->
  raw = raw.replace(_new_line, " ")
  raw = raw.replace(_comment, "")
  raw = raw.replace(_multi_spaces, " ")
  raw = raw.trim()
  raw
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
