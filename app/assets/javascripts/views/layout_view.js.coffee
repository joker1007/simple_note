s = window.SimpleNote
s.Views ?= {}

s.Views.LayoutView = Backbone.View.extend
  viewContainer: "#main"
  currentView: null

  setView: (view) ->
    if @currentView
      @currentView.remove()
    @currentView = view
    @$(@viewContainer).html(view.render().el)
