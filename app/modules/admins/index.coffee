navs = Backbone.Radio.channel "navs"
adminChannel = Backbone.Radio.channel "admins"
ListController = require "./list/controller"
ShowController = require "./show/controller"

Router = Mn.AppRouter.extend
    appRoutes:
        "admins": "list"
        "admins/:id": "show"

    # execute: (callback, args, name) ->
    #     callback.apply @, args if callback

    onRoute: (name, path, args) ->
        navs.request "nav:choose", "admins"

API =
    list: ->
        new ListController
            #foo: bar ## possible options to pass

    show: (id, admin) ->
        new ShowController
            id: id
            admin: admin

adminChannel.reply "admin:clicked", (admin) ->
    Backbone.history.navigate "admins/#{admin.id}"
    API.show admin.id, admin

module.exports = new Router controller: API
