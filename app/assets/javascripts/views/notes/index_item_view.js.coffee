#= require_tree ../../templates

s = SimpleNote
s.Views.Notes ?= {}

s.Views.Notes.IndexItemView = Backbone.View.extend
  tagName: 'li'
  id: -> "note-#{@model.id}"
  className: 'note'
  template: JST['notes/index_item']

  events:
    'click .note-title' : 'navigateToNote'
    'click .delete-note' : 'deleteNote'

  initialize: ->
    @listenTo @model, 'destroy', =>
      @remove()

  render: ->
    context = @model.toJSON()
    _.extend(context, previewText: @model.previewText())
    @$el.html(@template(context))
    this

  navigateToNote: (e) ->
    e.preventDefault()
    Backbone.history.navigate("notes/#{@model.id}", true)

  deleteNote: (e) ->
    e.preventDefault()
    if confirm('ノートを削除しますか？')
      @model.destroy()
