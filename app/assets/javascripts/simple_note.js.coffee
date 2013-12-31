'use strict'

window.SimpleNote =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    @router = new SimpleNote.Routers.NoteRouter()
    Backbone.history.start(pushState: true)
    console.log 'init SimpleNote!'

