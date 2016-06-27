Controller = require "./controller"

Router = Mn.AppRouter.extend
    appRoutes:
        "*notFound": "show"

API =
    show: ->
        new Controller

module.exports = new Router controller: API
