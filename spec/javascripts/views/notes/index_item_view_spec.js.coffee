#= require spec_helper

chai.should()

describe 'SimpleNote.Views.Notes.IndexItemView', ->
  beforeEach ->
    @note = new SimpleNote.Models.Note
      id: 1
      title: "Note Title"
      raw_body: "body text"

  describe '#render', ->
    it 'render li element for note object', ->
      view = new SimpleNote.Views.Notes.IndexItemView(model: @note)
      view.render()
      view.$el.should.have.id("note-1")
      view.$el.should.contain("Note Title")
      view.$el.should.contain("body text")

  describe 'click .note-title', ->
    it 'navigate to the note url', ->
      spy = sinon.spy(Backbone.history, "navigate")
      view = new SimpleNote.Views.Notes.IndexItemView(model: @note)
      view.render()
      view.$(".note-title").click()
      spy.calledWithExactly("notes/1", true).should.be.true
      spy.restore()

  describe 'click .delete-note', ->
    it 'invoke this.model destroy', ->
      spy = sinon.spy(@note, "destroy")
      confirmStub = sinon.stub(window, "confirm").returns(true)
      view = new SimpleNote.Views.Notes.IndexItemView(model: @note)
      view.render()
      view.$(".delete-note").click()
      spy.callCount.should.eq(1)

      spy.restore()
      confirmStub.restore()
