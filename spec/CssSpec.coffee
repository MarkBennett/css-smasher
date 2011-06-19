css = require('../lib/css')
Stylesheet = css.Stylesheet
Ruleset = css.Ruleset
Comment = css.Comment

describe "CSS.smash()", ->
  it "should remove comments from a CSS file", ->
    raw = "/* Comment */\nb{color:black;}"
    smashed = "b{color:black;}"

    expect(css.smash(raw)).toEqual(smashed)

  it "should remove extra lines breaks", ->
    raw = "p { font-color: red; }\n\n\nh1 { text-decoration: none; }\n\n.my-class { position: absolute: left: 0; }"
    smashed = "p { font-color: red; } h1 { text-decoration: none; } .my-class { position: absolute: left: 0; }"

    expect(css.smash(raw)).toEqual(smashed)

  it "should remove extra spaces", ->
    raw = "p              {       background:      blue;       }"
    smashed = "p { background: blue; }"

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

  it "should parse a ruleset with a multivalue decleration", ->
    raw = "h1 { font-family: awesome, arial, sans-serif; }"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Ruleset(["h1"], ["font-family:awesome,arial,sans-serif;"]))

    expect(css.parse(raw).lines).toEqual(stylesheet.lines)

  it "should parse a ruleset with multiple selectors", ->
    raw = "h1, h2, h3 { font-family: awesome; }"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Ruleset(["h1","h2","h3"], ["font-family:awesome;"]))

    expect(css.parse(raw).lines).toEqual(stylesheet.lines)

  it "should parse a ruleset with a class selector", ->
    raw = ".class { test: val; }"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Ruleset([".class"], ["test:val;"]))

    expect(css.parse(raw).lines).toEqual(stylesheet.lines)

  it "should parse a ruleset with an id selector", ->
    raw = "#myid { dec: val; }"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Ruleset(["#myid"], ["dec:val;"]))

    expect(css.parse(raw).lines).toEqual(stylesheet.lines)

  it "should parse a ruleset with combined selector", ->
    raw = "a.myclass { test: val; }"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Ruleset(["a.myclass"], ["test:val;"]))

    expect(css.parse(raw).lines).toEqual(stylesheet.lines)

  it "should parse a ruleset with a class name containing all possible characters", ->
    raw = ".abcdefghijklmnopqrstuvwyxzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_- { test: val; }"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Ruleset([".abcdefghijklmnopqrstuvwyxzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-"], ["test:val;"]))

    expect(css.parse(raw).lines).toEqual(stylesheet.lines)

  it "should parse a ruleset with an id name containing all possible characters", ->
    raw = "#abcdefghijklmnopqrstuvwyxzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_- { test: val; }"
    stylesheet = new Stylesheet
    stylesheet.addLine(new Ruleset(["#abcdefghijklmnopqrstuvwyxzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-"], ["test:val;"]))

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
