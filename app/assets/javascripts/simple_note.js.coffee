#= require_self
#= require_tree ./routers
#= require_tree ./models
#= require_tree ./views

'use strict'

@SimpleNote =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    @router = new SimpleNote.Routers.NoteRouter()
    Backbone.history.start(pushState: true)

