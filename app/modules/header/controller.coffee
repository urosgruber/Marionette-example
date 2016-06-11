channel = require "entities"
View = require "./view"
appChannel = Backbone.Radio.channel "app"

Controller = Mn.Object.extend

    initialize: (options) ->
        navs = channel.request "navs:entities"
        view = @getNavsView navs
        rootView = appChannel.request "root:view"
        @listenTo rootView, "render", (ev) ->
            rootView.showChildView "header", view

    getNavsView: (navs) ->
        new View.Navs
            collection: navs

module.exports = Controller
