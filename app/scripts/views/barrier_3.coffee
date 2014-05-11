define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'views/barrier_layout'
], ($, _, Backbone, JST,BarrierLayout) ->
  class Barrier2View extends BarrierLayout
    template: JST['app/scripts/templates/barrier_3.ejs']

    initialize: () ->

    next_roll: () ->
      window.location.hash = 'barrier3_complete'

    render: () ->
      super()
      @$el.find('#player').append @playerGrid(11,8,'','','巧','戈')
      @model.timing()