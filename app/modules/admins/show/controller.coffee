entities = require "entities"
View = require "./view"
appChannel = Backbone.Radio.channel "app"
BaseController = require "lib/controller"

Controller = BaseController.extend

    initialize: (options) ->
        { admin, id } = options
        admin or= entities.request "admins:entity", id

        view = @getAdminView admin

        @show view

    getAdminView: (admin) ->
        new View.Admin
            model: admin

module.exports = Controller
