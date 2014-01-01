#= require_tree ../../templates

window.SimpleNote ?=
  Views: {}
s = window.SimpleNote
s.Views.Notes ?= {}

s.Views.Notes.NewView = Backbone.View.extend
  className: 'new-note'
  template: JST['notes/new']

  bindings:
    '#input-note-title' : 'title'
    '#input-note-raw_body' : 'raw_body'

  render: ->
    @$el.html(@template(@model.toJSON()))
    $('#main').html(@el)
    @stickit()
    this
