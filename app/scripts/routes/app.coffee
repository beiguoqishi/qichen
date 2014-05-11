define [
  'backbone',
  'views/index',
  'views/barrier',
  'views/roll_success',
  'models/barrier'
], (Backbone,
    IndexView,
    BarrierView,
    RollSuccessView,
    BarrierModel) ->
  class AppRouter extends Backbone.Router
    routes:
      "": "index"
      index: "index"
      barrier: "barrier"
      roll_success: "roll_success"

    initialize:()->
      @barrier = new BarrierModel

    index: ->
      @changeView new IndexView
        model: @barrier

    barrier: ->
      @changeView new BarrierView({model: @barrier})

    roll_success: ->
      @changeView new RollSuccessView({model: @barrier})

    changeView: (view)->
      if @currentView?
        @currentView.undelegateEvents()
      @currentView = view
      @currentView.render()
