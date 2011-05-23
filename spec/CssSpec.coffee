css = require('../lib/css')

describe "CSS", ->
  it "should smash the cruft from a CSS string", ->
    expect(css.smash("")).toEqual("")
