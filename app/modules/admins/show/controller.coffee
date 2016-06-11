entities = require "entities"
View = require "./view"
appChannel = Backbone.Radio.channel "app"

Controller = Mn.Object.extend

    initialize: (options) ->
        debugger
        { admin, id } = options
        admin or= entities.request "admins:entity", id

        view = @getAdminView admin

        region = appChannel.request "default:region"
        region.show view

    getAdminView: (admin) ->
        new View.Admin
            model: admin

module.exports = Controller
