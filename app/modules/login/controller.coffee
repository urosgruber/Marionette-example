View = require "./view"
BaseController = require "lib/controller"

Controller = BaseController.extend

    initialize: (options) ->
        view = @getLoginView()
        @show view

    getLoginView: ->
        new View.Login

module.exports = Controller
