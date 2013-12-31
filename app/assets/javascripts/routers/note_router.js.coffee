window.SimpleNote ?=
  Routers: {}
s = window.SimpleNote

s.Routers.NoteRouter = Backbone.Router.extend
  routes:
    "notes/:id" : "show_note"
    "notes" : "index_notes"
    "" : "index_notes"

  index_notes: ->
    @notes ||= new s.Collections.NoteCollection()
    @notes.fetch()
