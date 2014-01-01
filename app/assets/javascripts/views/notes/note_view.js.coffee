#= require_tree ../../templates

window.SimpleNote ?=
  Views: {}
s = window.SimpleNote
s.Views.Notes ?= {}

s.Views.Notes.NoteView = Backbone.View.extend
  className: 'new-note'
  template: JST['notes/note']

  events:
    'click .submit-note-form' : 'submit'

  bindings:
    '#input-note-title' : 'title'
    '#input-note-raw_body' : 'raw_body'

  render: ->
    @$el.html(@template(@model.toJSON()))
    $('#main').html(@el)
    @stickit()
    this

  submit: (e) ->
    e.preventDefault()
    @trigger('clickSubmit')

