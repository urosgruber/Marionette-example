exports.config =
    paths:
        public: 'public'

    files:
        javascripts:
            joinTo:
                'vendor.js': /^(?!app)/,
                'app.js': /^app/

        stylesheets: joinTo: 'app.css'

        templates: joinTo: 'app.js'
    npm:
        globals:
            $: 'jquery'
            _: 'underscore'
            Backbone: 'backbone'
            Mn: 'backbone.marionette'

    ## Plugins configuration
    #plugins:
    #    handlebars:
    #         namespace: 'JST'
    #        pathReplace: /^app\//   #/^app\/javascripts\/|templates\//g
