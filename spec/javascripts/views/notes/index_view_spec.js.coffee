#= require spec_helper

chai.should()

describe 'SimpleNote.Views.Notes.IndexView', ->
  describe '#render', ->
    fixture.set('<div id="main"></div>')

    beforeEach ->
      @collection = new SimpleNote.Collections.NoteCollection()

    it 'append this el to #main', ->
      view = new SimpleNote.Views.Notes.IndexView(collection: @collection)
      view.render()
      $(fixture.el).find("#main").should.have("#notes")

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

    it 'render NewButtonView', ->
      collection = new SimpleNote.Collections.NoteCollection()
      view = new SimpleNote.Views.Notes.IndexView(collection: @collection)
      spy = sinon.spy(SimpleNote.Views.Notes.NewButtonView.prototype, "render")
      view.render()
      spy.callCount.should.eq(1)
      spy.restore()

  describe 'trigger reset of this.collection', ->
    it 're-render', ->
      @collection = new SimpleNote.Collections.NoteCollection()

      spy = sinon.spy(SimpleNote.Views.Notes.IndexView.prototype, "render")
      view = new SimpleNote.Views.Notes.IndexView(collection: @collection)
      @collection.trigger("reset")
      spy.callCount.should.eq(1)

      spy.restore()
