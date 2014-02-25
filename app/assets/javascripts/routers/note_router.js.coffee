s = @SimpleNote
s.Routers ?= {}

s.Routers.NoteRouter = Backbone.Router.extend
  routes:
    "notes/new" : "newNote"
    "notes/:id" : "showNote"
    "notes" : "indexNotes"
    ".*" : "indexNotes"

  initialize: (options) ->
    @layout = new s.Views.LayoutView(el: $("body"))
    @notes = new s.Collections.NoteCollection()

  indexNotes: ->
    indexView = new s.Views.Notes.IndexView(collection: @notes)
    @layout.setView(indexView)

    @notes.fetch(reset: true)

  newNote: ->
    @note = new s.Models.Note()
    @__renderNoteView()
    @listenTo @note, 'sync', =>
      @navigate("notes", true)

  showNote: (id) ->
    @note = @notes.get(id)
    if @note
      @__renderNoteView()
    else
      @note = new s.Models.Note(id: id)
      @note.fetch
        success: => @__renderNoteView()

  __renderNoteView: ->
    noteView = new s.Views.Notes.NoteView(model: @note)
    @layout.setView(noteView)
    @listenTo @currentView, 'clickSubmit', =>
      @note.save()
