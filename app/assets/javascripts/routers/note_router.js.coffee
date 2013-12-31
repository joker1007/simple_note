window.SimpleNote ?=
  Routers: {}
s = window.SimpleNote

s.Routers.NoteRouter = Backbone.Router.extend
  routes:
    "notes/:id" : "showNote"
    "notes" : "indexNotes"
    ".*" : "indexNotes"

  indexNotes: ->
    @notes ||= new s.Collections.NoteCollection()
    @currentView = new s.Views.Notes.IndexView(collection: @notes)
    @notes.fetch(reset: true)
