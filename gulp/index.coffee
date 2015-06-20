{argv} = require 'yargs'
fs = require 'fs'
onlyScripts = require './util/scriptFilter'

excludes = ['browserifyAndWatch.coffee', 'browserSync.coffee', 'watch.coffee', 'setWatch.coffee']
tasks = fs.readdirSync('./gulp/tasks/').filter onlyScripts
if argv.production
  tasks = tasks.filter (task) -> task not in excludes

require './tasks/' + task for task in tasks
