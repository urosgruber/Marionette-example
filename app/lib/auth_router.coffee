authChannel = Backbone.Radio.channel "auth"

Router = Mn.AppRouter.extend

    initialize: (options) ->
        authChannel.on "authorize", =>
            console.log "User is Authorized"

        authChannel.on "unauthorize", =>
            console.log "User is UnAuthorized"
            @_navigateToLogin()

    execute: (callback, args, name) ->
        authorized = authChannel.request "authorized"
        ## If not authorized prevent route execution
        unless authorized
            authChannel.trigger "unauthorize"
            false

        callback.apply @, args if callback

    _navigateToLogin: ->
        @navigate "login", trigger: true

module.exports = Router
