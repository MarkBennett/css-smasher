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
  addRule: (raw) ->
    @lines.push raw
  lines: ->
    @lines
exports.Stylesheet = Stylesheet

parse = (raw) ->
  stylesheet = new Stylesheet
  parser.yy = stylesheet
  parser.parse(raw)
  stylesheet

exports.parse = parse
exports.parser = parser
