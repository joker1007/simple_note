#= require spec_helper

chai.should()

describe 'SimpleNote.Models.Note',  ->
  describe '#previewText', ->
    it 'return max 140 characters', ->
      note = new SimpleNote.Models.Note(
        raw_body: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      )
      note.get("raw_body").length.should.eq(141)
      note.previewText().length.should.eq(140)

  describe '#renderBody', ->
    beforeEach ->
      @xhr = sinon.useFakeXMLHttpRequest()
      requests = @requests = []
      @xhr.onCreate = (xhr) ->
        requests.push xhr

    afterEach ->
      @xhr.restore()

    it 'fetch rendered HTML from /notes/rendering and set body attributes', ->
      note = new SimpleNote.Models.Note(raw_body: "## head2")
      note.renderBody()
      @requests[0].respond(200, {"Content-Type": "application/json"}, '{"body": "<h2>head2</h2>"}')
      note.get("body").should.eq("<h2>head2</h2>")

    it 'trigger "renderBody" event', ->
      note = new SimpleNote.Models.Note(raw_body: "## head2")
      spy = sinon.spy()
      note.on "renderBody", spy
      note.renderBody()
      @requests[0].respond(200, {"Content-Type": "application/json"}, '{"body": "<h2>head2</h2>"}')
      spy.called.should.be.true


