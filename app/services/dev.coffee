env = require "services/env"

module.exports =
    start: ->

        return unless env is "development"

        ## Configure for the Marionette Inspector
        if window.__agent and window.__agent.start
            window.__agent.start Backbone, Mn

        ## Turn on DEBUG mode for Radio
        Backbone.Radio.DEBUG = true

        # Disable AJAX cache in in developement
        $.ajaxSetup cache: false
