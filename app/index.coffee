##
## index
## Bootstrap & start our application
##

## Load our shims. In general, 'shims' are things that directly modify
## Backbone or Marionette. These shims set this app up to be
## in a Marionette v3-like state. I cannot suggest you use them
## unless you're absolutely sure you know what you're doing!

## Load our Handlebars helpers
require 'lib/view_helpers'

## Start dev env
dev = require 'services/dev'
dev.start()

## Load & start our app
# can also use $ ->jQ ready event
document.addEventListener 'DOMContentLoaded', () ->
    application = require 'application'
    application.start()
