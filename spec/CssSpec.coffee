css = require('../lib/css')

describe "CSS", ->
  it "should remove comments from a CSS file", ->
    raw = "/* Comment /*\nb{color:black;}"
    smashed = "b{color:black;}"

    expect(css.smash(raw)).toEqual(smashed)
