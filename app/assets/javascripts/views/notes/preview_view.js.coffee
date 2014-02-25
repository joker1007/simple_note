#= require_tree ../../templates

s = @SimpleNote
s.Views.Notes ?= {}

s.Views.Notes.PreviewView = Backbone.View.extend
  template: JST['notes/preview']

  bindings:
    '#note-title' : 'title'
    '#note-body' :
      observe: 'raw_body'
      update: _.debounce(($el, val, model, options) =>
          model.renderBody().done (data) ->
            $el.html(data.body)
      , 400)

  render: ->
    @$el.html(@template(@model.toJSON()))
    @model.trigger('change:raw_body')
    @stickit()
