rootView = require "views/root-view" #new RootView()
# routerChannel = Backbone.Radio.channel "router"
# appChannel = Backbone.Radio.channel "app"
# auth = require "services/auth"
# user = require "entities/user"

App = Mn.Application.extend
    region: '.application'
    channelName: 'app'

    ## Could be present in rootView
    radioRequests:
        'root:view': -> rootView
        'default:region': -> rootView.getRegion 'content'

    initialize: (options) ->
        ## Attach it to the window for debugging
        window.app = @

        ## Set app verison
        @VERSION = options.VERSION

    onBeforeStart: (options) ->

        ## Load entities handlers
        require 'entities'

        ## Load modules
        require 'modules'

    onStart: (options) ->
        ## Show root view layout
        @showView rootView

        ## Start history
        Backbone.history.start pushState: true


    navigate: (route, options = {}) ->
        Backbone.history.navigate route, options


## Create Application
app = new App window._initData

module.exports = app



#
#
# App = Mn.Application.extend
#     initialize: (options) ->
#         @$body = $(document.body)
#
#         ## Attach root view
#         @rootView = rootView
#         @rootView.render()
#
#         appChannel.reply "default:region", ->
#             rootView.getRegion "content"
#
#         appChannel.reply "root:view", -> rootView
#
#         # @rootRoute = ""
#
#
