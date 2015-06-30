class Database
	mongoose = require 'mongoose'

	constructor: (conf) ->
		if conf? && conf.dbTimeout? && conf.dbURL?
			options =
				replset:
					socketOptions:
						connectTimeoutMS: conf.dbTimeout
			try
				mongoose.connect conf.dbURL, options
			catch ex
				console.log ex
		else
			console.log "Database Config Error"
			console.log conf
module.exports = Database
