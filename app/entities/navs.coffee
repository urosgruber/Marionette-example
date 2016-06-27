channel = require "entities"

Nav = Backbone.Model.extend

    isDivider: -> @get("divider")
    isChosen: -> @get("chosen")
    isVisible: -> @get("visible")

    initialize: (data) ->
        new Backbone.Chooser @

Navs = Backbone.Collection.extend
    model: Nav

    getFirstVisible: ->
        @find (nav) -> nav.isVisible()

    initialize: ->
        new Backbone.SingleChooser @
        @channel = Backbone.Radio.channel "navs"
        @configureEvents()

    chooseByName: (nav) ->
        @choose (@findWhere(name: nav) or @getFirstVisible())

    chooseById: (id) ->
        @choose (@findWhere(id: id) or @getFirstVisible())

    # Register our events on the channel
    configureEvents: ->
        @channel.reply "nav:choose", (nav) =>
            #parts = nav.split ":"
            #debugger
            @chooseById nav
            @getFirstChosen()

API =
    getNavs: (params = {}) ->
        new Navs [
            { id: "dashboard", name: "Dashboard", url: "",        icon: "icon-dashboard", visible: true }
            { id: "admins",    name: "Admins",    url: "admins",  icon: "icon-admins",    visible: true }
            { id: "profile",   name: "Profile",   url: "profile", icon: "icon-profile",   visible: true }
            { id: "about",     name: "About",     url: "about",   icon: "icon-about",     visible: true }
        ]

channel.reply "navs:entities", ->
    API.getNavs()

#module.exports = API
