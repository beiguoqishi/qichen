define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'views/barrier_layout'
], ($, _, Backbone, JST,BarrierLayout) ->
  class Barrier1View extends BarrierLayout
    template: JST['app/scripts/templates/barrier_1.ejs']

    initialize: () ->

    next_roll: () ->
      @model.save_time()
      window.location.hash = 'barrier1_complete'

    render: () ->
        super()
        @$el.find('#player').append @playerGrid(11,8,'','','大','太')
        @model.start_game().timing()
