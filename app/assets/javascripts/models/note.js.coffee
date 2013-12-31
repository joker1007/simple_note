window.SimpleNote ?=
  Models: {}
s = window.SimpleNote

s.Models.Note = Backbone.Model.extend
  urlRoot: '/notes'

  previewText: (length = 140) ->
    @get("raw_body")?.substring(0, length)

s.Collections.NoteCollection = Backbone.Collection.extend
  model: s.Models.Note
  url: '/notes'
