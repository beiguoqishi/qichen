define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class StartView extends Backbone.View
    template: JST['app/scripts/templates/index.ejs']

    el      : '#main'

    events:
      'click #start_game': 'startGame'

    startGame: (e) ->
      @model.start_game()

    initialize: () ->

    render: () ->
        @$el.html @template(@model.toJSON())
