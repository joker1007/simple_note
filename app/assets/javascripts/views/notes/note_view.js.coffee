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
    'click .back' : 'navigateToNoteIndex'

  bindings:
    '#input-note-title' : 'title'
    '#input-note-raw_body' : 'raw_body'

  render: ->
    @$el.html(@template(@model.toJSON()))
    preview = new s.Views.Notes.PreviewView(model: @model, el: @$('.preview-col'))
    preview.render()
    @stickit()
    this

  submit: (e) ->
    e.preventDefault()
    @trigger('clickSubmit')

  navigateToNoteIndex: (e) ->
    e.preventDefault()
    Backbone.history.navigate('notes', true)
