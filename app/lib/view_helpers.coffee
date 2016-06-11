# Put your handlebars.js helpers here.
Handlebars = require "handlebars"

Handlebars.logger.level = 0

Handlebars.registerHelper 'pick', (val, options) ->
    return options.hash[val]

Handlebars.registerHelper "numberFormat", (val, options) ->
    return 0 unless val
    return val if val is 0
    val.toFixed(1)
