appChannel = Backbone.Radio.channel "app"

class Controller extends Mn.Object
    channelName: "app"

    constructor: (options = {}) ->
        @region = options.region or appChannel.request("default:region")
        super options
        @_instance_id = _.uniqueId("controller")

    destroy: ->
        super

    show: (view, options = {}) ->
        _.defaults options,
            loading: false
            region: @region

        ## allow us to pass in a controller instance instead of a view
        ## if controller instance, set view to the mainView of the controller
        view = if view.getMainView then view.getMainView() else view
        throw new Error("getMainView() did not return a view instance or #{view?.constructor?.name} is not a view instance") if not view

        @setMainView view
        @_manageView view, options

    getMainView: ->
        @_mainView

    setMainView: (view) ->
        ## the first view we show is always going to become the mainView of our
        ## controller (whether its a layout or another view type).  So if this
        ## *is* a layout, when we show other regions inside of that layout, we
        ## check for the existance of a mainView first, so our controller is only
        ## closed down when the original mainView is closed.
        return if @_mainView
        @_mainView = view

        @listenTo view, "show", -> @onMainShow view
        @listenTo view, "destroy", @destroy

    onMainShow: (view) ->

    _manageView: (view, options) ->
        if options.loading
            ## show the loading view
            # require("views/loading-view")(view, options)
            #App.execute "show:loading", view, options
        else
            options.region.show view

    mergeDefaultsInto: (obj) ->
        obj = if _.isObject(obj) then obj else {}
        _.defaults obj, @_getDefaults()

    _getDefaults: ->
        _.clone _.result(@, "defaults")

module.exports = Controller
