#= require_tree ../../templates

window.SimpleNote ?=
  Views: {}
s = window.SimpleNote
s.Views.Notes ?= {}

s.Views.Notes.IndexItemView = Backbone.View.extend
  tagName: 'li'
  id: -> "note-#{@model.id}"
  className: 'note'
  template: JST['notes/index_item']

  events:
    'click a' : 'navigateToNote'

  render: ->
    context = @model.toJSON()
    _.extend(context, previewText: @model.previewText())
    @$el.html(@template(context))
    this

  navigateToNote: (e) ->
    e.preventDefault()
    Backbone.history.navigate("notes/#{@model.id}", true)

