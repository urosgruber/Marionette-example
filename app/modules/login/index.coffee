Controller = require "./controller"

Router = Mn.AppRouter.extend
    appRoutes:
        "login": "show"

API =
    show: ->
        new Controller

module.exports = new Router controller: API
