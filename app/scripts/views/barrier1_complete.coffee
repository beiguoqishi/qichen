define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class Barrier1CompleteView extends Backbone.View
    template: JST['app/scripts/templates/barrier1_complete.ejs']

    el: '#main'

    events:
      'click .to-second': 'toSecond'

    toSecond: (e) ->
      window.location.hash = 'barrier_2'

    initialize: () ->

    render: () ->
        @$el.html @template()
