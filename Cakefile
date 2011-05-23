spawn = (require 'child_process').spawn

to_stdio = (emitter) ->
  emitter.stdout.on 'data', (data) -> process.stdout.write data
  emitter.stderr.on 'data', (data) -> process.stderr.write data
  emitter

task 'spec', 'Run the project specifications', (options) ->
  to_stdio spawn 'jasmine-node', ['--coffee', '--color', 'spec']
  

task 'build:watch', 'Build and then watch the CoffeeScript for changes', (options) ->
  to_stdio spawn 'coffee', ['-w', '-c', 'lib']

task 'build:parser', 'Build the parser from jison definition', (options) ->
  to_stdio spawn 'jison', ['lib/parser.jison', '-o', 'lib/parser.js']
