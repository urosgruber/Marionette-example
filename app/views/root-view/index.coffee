RootView = Mn.View.extend
    channelName: 'rootview'

    template: "views/root-view/root"

    regions:
        header  : '.application__header'
        content : '.application__content'

module.exports = new RootView
