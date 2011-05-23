exec = (require 'child_process').exec

task 'spec', 'Run the project specifications', (options) ->
  exec 'jasmine-node --coffee --color spec', (error, stdout, stderr) ->
    console.log stdout 
