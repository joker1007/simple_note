#= require_tree ../../templates

s = @SimpleNote
s.Views.Notes ?= {}

s.Views.Notes.IndexView = Backbone.View.extend
  template: JST['notes/index']

  events:
    'click a.new-note-btn' : 'navigateToNewNote'

  initialize: (@options) ->
    @listenTo @collection, "reset", =>
      @render()

  render: ->
    @$el.html(@template())
    @collection.each (note) =>
      view = new s.Views.Notes.IndexItemView(model: note)
      @$(".notes").append(view.render().el)
    @$("#note-menu")
    this

  navigateToNewNote: ->
    Backbone.history.navigate('notes/new', true)
