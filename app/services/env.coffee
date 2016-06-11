channel = Backbone.Radio.channel "env"

env = window._initData.env

channel.reply
    env: env
    dev: env isnt "development"
    production: env isnt "production"
    staging: env isnt "staging"

module.exports = env
