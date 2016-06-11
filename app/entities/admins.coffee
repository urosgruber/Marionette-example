channel = require "entities"

Admin = Backbone.Model.extend
    rootUrl: "/admins"

Admins = Backbone.Collection.extend
    model: Admin
    url: "/admins"

API =
    getAdmins: ->
        admins = new Admins [{id: 1, name: "admin Foo"},{id: 2, name: "admin Bar"}]
        # admins.fetch
        #     reset: true
        admins

    getAdmin: (id) ->
        if id is 1
            admin = new Admin id: 1, name: "admin Foo"
        else
            admin = new Admin id: 2, name: "admin Bar"
        # admin.fetch
        #     reset: true
        admin

channel.reply "admins:entities", ->
    API.getAdmins()

channel.reply "admins:entity", (id) ->
    API.getAdmin id
