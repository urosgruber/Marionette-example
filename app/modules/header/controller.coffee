channel = require "entities"
View = require "./view"
BaseController = require "lib/controller"
appChannel = Backbone.Radio.channel "app"

Controller = BaseController.extend
    channelName: "auth"
    radionEvents:
        "authorize": "onAutorize"

    initialize: (options) ->
        rootView = appChannel.request "root:view"
        @listenTo rootView, "render", (ev) ->
            @showNavs rootView.getRegion("header")

    onAutorize: ->
        
    showNavs: (region) ->
        authorized = @getChannel().request "authorized"
        navs = channel.request "navs:entities"
        view = @getNavsView authorized, navs

        @show view, region: region

    getNavsView: (auth, navs) ->
        View = if auth then View.Navs else View.Unauth
        new View
            collection: navs

module.exports = Controller
