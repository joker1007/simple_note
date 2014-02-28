s = @SimpleNote
s.Models ?= {}

s.Models.Note = Backbone.Model.extend
  urlRoot: '/notes'

  initialize: ->
    @listenTo @, 'change:raw_body', _.debounce =>
      @renderBody()
    , 300

  previewText: (length = 140) ->
    @get("raw_body")?.substring(0, length)

  renderBody: ->
    $.ajax("/notes/rendering", 
      type: "POST"
      dataType: 'json'
      data: {raw_body: @get('raw_body')}
    ).done (data) =>
      @set('body', data.body)

s.Collections.NoteCollection = Backbone.Collection.extend
  model: s.Models.Note
  url: '/notes'
