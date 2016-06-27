View = require "./view"
BaseController = require "lib/controller"

Controller = BaseController.extend

    initialize: (options) ->
        view = @getAboutView()
        @show view

    getAboutView: ->
        new View

module.exports = Controller
