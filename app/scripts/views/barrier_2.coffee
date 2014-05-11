define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'views/barrier_layout'
], ($, _, Backbone, JST,BarrierLayout) ->
  class Barrier2View extends BarrierLayout
    template: JST['app/scripts/templates/barrier_2.ejs']

    initialize: () ->

    next_roll: () ->
      window.location.hash = 'barrier2_complete'

    render: () ->
      super()
      @$el.find('#player').append @playerGrid(11,8,'','','省','溴')
      @model.timing()
