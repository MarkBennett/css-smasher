spawn = (require 'child_process').spawn

stream_to_stdio = (emitter) ->
  emitter.stdout.on 'data', (data) -> process.stdout.write data
  emitter.stderr.on 'data', (data) -> process.stderr.write data

task 'spec', 'Run the project specifications', (options) ->
  runner = spawn 'jasmine-node', ['--coffee', '--color', 'spec']

  stream_to_stdio runner

task 'build:watch', 'Build and then watch the CoffeeScript for changes', (options) ->
  builder = spawn 'coffee', ['-w', '-c', 'lib']

  stream_to_stdio builder
