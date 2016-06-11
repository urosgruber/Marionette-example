do (Backbone) ->
    _sync = Backbone.sync

    Backbone.sync = (method, entity, options = {}) ->
        _.defaults options,
            isBackbone: true
            beforeSend: _.bind(methods.beforeSend,  entity, options)
            complete:   _.bind(methods.complete,    entity, options)

        sync = _sync(method, entity, options)
        if not entity._fetch and method is "read"
            entity._fetch = sync
        if not entity._save and (method is "update" or "create")
            entity._save = sync
        sync

    methods =
        beforeSend: (options, jqXHR, settings) ->
            @trigger "sync:start", @

        complete: (options, jqXHR, settings) ->
            @trigger "sync:stop", @
