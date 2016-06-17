Nav = Mn.View.extend
    template: "modules/header/templates/nav"
    tagName: "li"
    className: ->

    modelEvents:
        "change:chosen" : "render"

class Navs extends Mn.CollectionView
    childView: Nav
    tagName: "ul"

    addChild: (item, ItemView, index) ->
        return unless item.isVisible()
        super

Unauth  = Mn.View.extend template: false

module.exports =
    Navs: Navs
    Unauth: Unauth
