css = require('../lib/css')

describe "CSS.smash()", ->
  it "should remove comments from a CSS file", ->
    raw = "/* Comment */\nb{color:black;}"
    smashed = "b{color:black;}"

    expect(css.smash(raw)).toEqual(smashed)

describe "CSS.parse()", ->
  it "should parse a ruleset", ->
    raw = "p { text:black; }"
    stylesheet = new css.Stylesheet
    stylesheet.addRule("p { text:black; }")

    expect(css.parse(raw).lines).toEqual(stylesheet.lines)
