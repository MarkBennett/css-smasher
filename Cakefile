spawn = (require 'child_process').spawn

to_stdio = (emitter) ->
  emitter.stdout.on 'data', (data) -> process.stdout.write data
  emitter.stderr.on 'data', (data) -> process.stderr.write data
  emitter

task 'spec', 'Run the project specifications', (options) ->
  to_stdio spawn 'jasmine-node', ['--coffee', '--color', 'spec']
  

task 'build:watch', 'Build and then watch the CoffeeScript for changes', (options) ->
  to_stdio spawn 'coffee', ['--watch', '--compile', 'lib', 'spec']

task 'build:parser', 'Build the parser from jison definition', (options) ->
  to_stdio spawn 'jison', ['lib/parser.jison', '-o', 'lib/parser.js']

task 'build', 'Build all our pieces for committing it to GitHub', (options) ->
  to_stdio spawn 'jison', ['lib/parser.jison', '-o', 'lib/parser.js']
  to_stdio spawn 'coffee', ['--compile', 'lib', 'spec']
