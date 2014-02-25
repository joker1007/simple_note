#= require spec_helper

chai.should()

describe 'SimpleNote.Views.Notes.IndexView', ->
  describe '#render', ->
    beforeEach ->
      @collection = new SimpleNote.Collections.NoteCollection()

    it 'render el that has ul.notes and a.new-note-btn', ->
      view = new SimpleNote.Views.Notes.IndexView(collection: @collection)
      view.render()
      view.$el.should.have("ul.notes")
      view.$el.should.have("a.new-note-btn")

    it 'render each item view', ->
      @collection = new SimpleNote.Collections.NoteCollection(
        [
          {id: 1, raw_body: "raw_body"},
          {id: 2, raw_body: "raw_body"},
        ]
      )
      view = new SimpleNote.Views.Notes.IndexView(collection: @collection)
      spy = sinon.spy(SimpleNote.Views.Notes.IndexItemView.prototype, "render")
      view.render()
      spy.callCount.should.eq(2)
      spy.restore()

  describe 'trigger reset of this.collection', ->
    it 're-render', ->
      @collection = new SimpleNote.Collections.NoteCollection()

      spy = sinon.spy(SimpleNote.Views.Notes.IndexView.prototype, "render")
      view = new SimpleNote.Views.Notes.IndexView(collection: @collection)
      @collection.trigger("reset")
      spy.callCount.should.eq(1)
      spy.restore()

  describe 'click .new-note-btn', ->
    it 'navigate to new_note path', ->
      spy = sinon.spy(Backbone.history, "navigate")

      view = new SimpleNote.Views.Notes.IndexView(collection: @collection)
      view.render()
      view.$("a.new-note-btn").click()
      spy.calledWithExactly("notes/new", true).should.be.true
      spy.restore()
