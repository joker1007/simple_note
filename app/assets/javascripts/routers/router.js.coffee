window.SimpleNote ?=
  Routers: {}
s = window.SimpleNote

s.Routers.Router = Backbone.Router.extend
  routes:
    "/notes/:id" : "show_note"
    "/notes" : "index_note"
    "/" : "index_note"
