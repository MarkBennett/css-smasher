css = require('../lib/css')
Stylesheet = css.Stylesheet
Ruleset = css.Ruleset
Comment = css.Comment

describe "CSS.smash()", ->
  it "should remove comments from a CSS file", ->
    raw = "/* Comment */\nb{color:black;}"
    smashed = "b{color:black;}"

    expect(css.smash(raw)).toEqual(smashed)

describe "CSS.parse()", ->
  it "should parse a ruleset", ->
    raw = "p { text:black; }"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Ruleset(["p"], ["text:black;"]))

    expect(css.parse(raw).lines).toEqual(stylesheet.lines)

  it "should parse rulesets with extra whitespace in declerations", ->
    raw ="p { text : black; }"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Ruleset(["p"], ["text:black;"]))

    expect(css.parse(raw).lines).toEqual(stylesheet.lines)

  it "should parse rulesets without a semi-colon after the decleration", ->
    raw ="p { text : black }"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Ruleset(["p"], ["text:black;"]))

    expect(css.parse(raw).lines).toEqual(stylesheet.lines)

  it "should parse a ruleset with multiple declerations", ->
    raw = "p { text:black; align:center; }"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Ruleset(["p"], ["text:black;", "align:center;"]))

    expect(css.parse(raw).lines).toEqual(stylesheet.lines)

  it "should parse a comment", ->
    raw = "/* Blah */"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Comment("/* Blah */"))
    
    expect(css.parse(raw).lines).toEqual(stylesheet.lines)

  it "should parse multiple lines", ->
    raw = "/* Test */\nb { color:blue; }"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Comment("/* Test */"))
    stylesheet.addLine(new Ruleset(["b"], ["color:blue;"]))
    
    expect(css.parse(raw).lines).toEqual(stylesheet.lines)
