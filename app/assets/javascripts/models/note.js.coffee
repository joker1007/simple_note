s = SimpleNote
s.Views.Notes ?= {}

s.Models.Note = Backbone.Model.extend
  urlRoot: '/notes'

  previewText: (length = 140) ->
    @get("raw_body")?.substring(0, length)

  renderBody: ->
    $.ajax("/notes/rendering", 
      type: "GET"
      dataType: 'json'
      data: {raw_body: @get('raw_body')}
    ).done (data) =>
      @set('body', data.body)
      @trigger('renderBody', data)

s.Collections.NoteCollection = Backbone.Collection.extend
  model: s.Models.Note
  url: '/notes'
