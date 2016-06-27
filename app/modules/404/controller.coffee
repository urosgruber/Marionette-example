View = require "./view"
BaseController = require "lib/controller"

Controller = BaseController.extend

    initialize: (options) ->
        view = @get404View()
        @show view

    get404View: ->
        new View

module.exports = Controller
