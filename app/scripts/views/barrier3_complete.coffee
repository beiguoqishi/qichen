define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class Barrier3CompleteView extends Backbone.View
    template: JST['app/scripts/templates/barrier3_complete.ejs']

    tagName: 'div'

    id: ''

    className: ''

    events: {}

    initialize: () ->
        @listenTo @model, 'change', @render

    render: () ->
        @$el.html @template(@model.toJSON())
