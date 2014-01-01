window.SimpleNote ?=
  Routers: {}
s = window.SimpleNote

s.Routers.NoteRouter = Backbone.Router.extend
  routes:
    "notes/new" : "newNote"
    "notes/:id" : "showNote"
    "notes" : "indexNotes"
    ".*" : "indexNotes"

  initialize: (options) ->
    @notes = new s.Collections.NoteCollection()

  indexNotes: ->
    @currentView.remove() if @currentView

    @currentView = new s.Views.Notes.IndexView(collection: @notes)
    @notes.fetch(reset: true)

  newNote: ->
    @currentView.remove() if @currentView

    @note = new s.Models.Note()
    @__renderNoteView()
    @listenTo @note, 'sync', =>
      @navigate("notes", true)

  showNote: (id) ->
    @currentView.remove() if @currentView

    @note = @notes.get(id)
    if @note
      @__renderNoteView()
    else
      @note = new s.Models.Note(id: id)
      @note.fetch
        success: => @__renderNoteView()

  __renderNoteView: ->
    @currentView = new s.Views.Notes.NoteView(model: @note)
    @listenTo @currentView, 'clickSubmit', =>
      @note.save()
    @currentView.render()
