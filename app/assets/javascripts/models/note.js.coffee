window.SimpleNote ?=
  Models: {}
s = window.SimpleNote

s.Models.Note = Backbone.Model.extend
  urlRoot: '/notes'

s.Collections.NoteCollection = Backbone.Collection.extend
  url: '/notes'
