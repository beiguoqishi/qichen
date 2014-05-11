define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class Barrier1CompleteView extends Backbone.View
    template: JST['app/scripts/templates/barrier2_complete.ejs']

    el: '#main'

    events:
      'click .to-third': 'toThird'

    toThird: (e) ->
      window.location.hash = 'barrier_3'

    initialize: () ->

    render: () ->
      @$el.html @template()
