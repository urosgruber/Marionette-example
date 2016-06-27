navs = Backbone.Radio.channel "navs"
Controller = require "./controller"

Router = Mn.AppRouter.extend
    appRoutes:
        "about": "show"

    onRoute: (name, path, args) ->
        navs.request "nav:choose", "about"

API =
    show: ->
        new Controller

module.exports = new Router controller: API
