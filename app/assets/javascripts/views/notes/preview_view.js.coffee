#= require_tree ../../templates

s = @SimpleNote
s.Views.Notes ?= {}

s.Views.Notes.PreviewView = Backbone.View.extend
  template: JST['notes/preview']

  bindings:
    '#note-title' : 'title'

  initialize: ->
    @listenTo @model, 'change:body', _.bind(@_updatePreview, @)

  render: ->
    @$el.html(@template(@model.toJSON()))
    @_updatePreview()
    @stickit()

  _updatePreview: ->
    @$('#note-body').html(@model.get("body"))
    @$("code").each (i, e) ->
      hljs.highlightBlock(e)
