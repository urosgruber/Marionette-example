entities = require "entities"
View = require "./view"
appChannel = Backbone.Radio.channel "app"
adminChannel = Backbone.Radio.channel "admins"

Controller = Mn.Object.extend

    initialize: (options) ->
        admins = entities.request "admins:entities"
        view = @getAdminsView admins

        @listenTo view, "childview:admin:clicked", (child, args) ->
            adminChannel.request "admin:clicked", child.model

        region = appChannel.request "default:region"
        region.show view

    getAdminsView: (admins) ->
        new View.Admins
            collection: admins

module.exports = Controller
