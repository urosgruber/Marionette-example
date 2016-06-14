entities = require "entities"
View = require "./view"
BaseController = require "lib/controller"

appChannel = Backbone.Radio.channel "app"
adminChannel = Backbone.Radio.channel "admins"

Controller = BaseController.extend

    initialize: (options) ->
        admins = entities.request "admins:entities"
        view = @getAdminsView admins

        @listenTo view, "childview:admin:clicked", (child, args) ->
            adminChannel.request "admin:clicked", child.model

        @show view

    getAdminsView: (admins) ->
        new View.Admins
            collection: admins

module.exports = Controller
