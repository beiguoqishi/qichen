define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class RollSuccessView extends Backbone.View
    template: JST['app/scripts/templates/roll_success.ejs']

    el: '#main'

    events:
      'click .next-roll': 'nextRoll'
      'click .again'    : 'again'
      'click .share'    : 'share'

    again: ->
      window.location.hash = ''

    share: ->
      @$el.find('.share-area').html(_.template($('#share_list').html())())

    nextRoll: (e) ->
      if @model.get('roll_num') > 3 && @model.get('complete_roll') >= 3
        @model.set('show_rank',true)
        @render()
      else
        @model.set('show_rank',false)
        window.location.hash = 'barrier'

    initialize: () ->
      if @model.to_begin()
        window.location.hash = ''

    render: () ->
        @$el.html @template(@model.toJSON())
