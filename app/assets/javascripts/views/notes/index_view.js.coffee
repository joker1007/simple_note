window.SimpleNote ?=
  Views: {}
s = window.SimpleNote
s.Views.Notes ?= {}

s.Views.Notes.IndexView = Backbone.View.extend
  tagName: 'ul'
  id: 'notes'

  initialize: (@options) ->
    @listenTo @collection, "reset", =>
      @render()

  render: ->
    @collection.each (note) =>
      view = new s.Views.Notes.IndexItemView(model: note)
      @$el.append(view.render().el)
    $('#main').html(@el)
    newButtonView = new s.Views.Notes.NewButtonView()
    $('#main').prepend(newButtonView.render().el)
    this
