window.SimpleNote ?=
  Routers: {}
s = window.SimpleNote

s.Routers.NoteRouter = Backbone.Router.extend
  routes:
    "notes/new" : "newNote"
    "notes/:id" : "showNote"
    "notes" : "indexNotes"
    ".*" : "indexNotes"

  indexNotes: ->
    @notes ||= new s.Collections.NoteCollection()
    @currentView.remove() if @currentView
    @currentView = new s.Views.Notes.IndexView(collection: @notes)
    @notes.fetch(reset: true)

  newNote: ->
    @note = new s.Models.Note()
    @currentView.remove() if @currentView
    @currentView = new s.Views.Notes.NewView(model: @note)
    @listenTo @currentView, 'clickSubmit', =>
      @note.save()
    @currentView.render()
