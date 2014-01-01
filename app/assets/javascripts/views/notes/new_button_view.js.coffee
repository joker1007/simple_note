#= require_tree ../../templates

window.SimpleNote ?=
  Views: {}
s = window.SimpleNote
s.Views.Notes ?= {}

s.Views.Notes.NewButtonView = Backbone.View.extend
  className: 'new-button-block'
  template: JST['notes/new_button']
  events:
    'click a' : 'navigateToNewNote'

  render: ->
    @$el.html(@template())
    this

  navigateToNewNote: ->
    Backbone.history.navigate('notes/new', true)
