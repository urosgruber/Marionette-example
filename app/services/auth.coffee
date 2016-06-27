##
## auth
## Manages anything and everything related to authorization
##

Cookies = require "js-cookie"
TOKEN_NAME = "accessToken"

Auth = Mn.Object.extend

    token: null
    authorized: false
    channelName: "auth"

    radioRequests:
        "authorized" : "getAuthorized"
        "token"      : "getToken"
        "login"      : "login"
        "logout"     : "logout"

    initialize: (options) ->
        @_determineLogin()
        @_configureAjax()

    getAuthorized: -> @authorized

    getToken: -> @token

    # Log us out by destroying the token
    logout: ->
        Cookies.remove TOKEN_NAME

        @authorized = false
        @token = null

        channel = @getChannel()
        channel.trigger "logout"
        channel.trigger "unathorize"

    login: (token) ->
        secure = window.location.protocol is "https:"
        Cookies.set TOKEN_NAME, token,
            secure: secure
            expires: 1

        @authorized = true
        @token = token
        @_triggerAutorize()

    _triggerAutorize: ->
        @getChannel().trigger "authorize",
            token: @token
            authorized: @authorized

    # Check if we're authorized based on the cookie or sessionStorage
    _determineLogin: ->
        token = Cookies.get TOKEN_NAME
        # Set the status of our authorization to true
        # if there is any cookie avilable. Backend will throw 401
        # if token is not valid on the next call
        if token
            @authorized = true
            @token = token

            # Trigger it on the channel
            @_triggerAutorize()

    # Include our token in every subsequent request
    _configureAjax: ->
        self = @
        $.ajaxSetup
            statusCode:
                401: (resp) ->
                    self.getChannel().trigger "unathorize" unless @url is "/login"


        $.ajaxPrefilter (options, originalOptions, jqXHR) =>
            if @authorized
                jqXHR.setRequestHeader "Authorization", "Bearer #{@token}"
            return

module.exports = new Auth
