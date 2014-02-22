#= require spec_helper

chai.should()

describe 'SimpleNote.Views.Notes.NoteView', ->
  fixture.set('<div id="main"></div>')
  beforeEach ->
    @note = new SimpleNote.Models.Note
      id: 1
      title: "Note Title"
      raw_body: "body text"

  describe '#render', ->
    it "render div.new-note el for note form", ->
      view = new SimpleNote.Views.Notes.NoteView(model: @note)
      view.render()
      view.$el.should.have.class("new-note")

    it "replace #main content with this.el", ->
      view = new SimpleNote.Views.Notes.NoteView(model: @note)
      view.render()
      $(fixture.el).find("#main").should.have(".new-note")

    it "render PreviewView", ->
      spy = sinon.spy(SimpleNote.Views.Notes.PreviewView.prototype, "render")
      view = new SimpleNote.Views.Notes.NoteView(model: @note)
      view.render()
      spy.callCount.should.eq(1)
      spy.restore()

  describe 'click .submit-note-form', ->
    it 'trigger clickSubmit event', ->
      spy = sinon.spy()
      view = new SimpleNote.Views.Notes.NoteView(model: @note)
      view.on "clickSubmit", spy
      view.render()
      view.$(".submit-note-form").click()
      spy.callCount.should.eq(1)

  describe 'click .back', ->
    it 'navigate to notes url', ->
      spy = sinon.spy(Backbone.history, "navigate")
      view = new SimpleNote.Views.Notes.NoteView(model: @note)
      view.render()
      view.$(".back").click()
      spy.calledWithExactly("notes", true).should.be.true

