Admin = Mn.View.extend
    template: "modules/admins/list/templates/admin"
    tagName: "li"
    triggers:
        "click": "admin:clicked"

Admins = Mn.CollectionView.extend
    childView: Admin
    tagName: "ul"

module.exports = Admins: Admins
