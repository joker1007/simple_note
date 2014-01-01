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
    @currentView.remove() if @currentView

    @notes ||= new s.Collections.NoteCollection()
    @currentView = new s.Views.Notes.IndexView(collection: @notes)
    @notes.fetch(reset: true)

  newNote: ->
    @currentView.remove() if @currentView

    @note = new s.Models.Note()
    @currentView = new s.Views.Notes.NoteView(model: @note)
    @listenTo @currentView, 'clickSubmit', =>
      @note.save()
    @currentView.render()

  showNote: (id) ->
    @currentView.remove() if @currentView

    @note = @notes.get(id)
    @currentView = new s.Views.Notes.NoteView(model: @note)
    @listenTo @currentView, 'clickSubmit', =>
      @note.save()
    @currentView.render()
