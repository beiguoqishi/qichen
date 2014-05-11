define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class BarrierView extends Backbone.View
    template: JST['app/scripts/templates/barrier.ejs']

    el: '#main'

    initialize: () ->
      if parseInt(@model.get('complete_roll')) is 3
        window.location.hash = 'roll_success'

    render: () ->
      @$el.html @template(@model.toJSON())
      @$el.find('#player').empty().append(
        @playerGrid(@model.get('row'), @model.get('col'), @model.get('c_img'), @model.get('o_img'),
          @model.get('f1'), @model.get('f2')))
      if (@model.get('roll_num') == 1)
        @model.start_game()
      @model.timing()

    events:
      'click #player_table td': 'playing'

    playing: (e) ->
      $td = $(e.target)
      if $td.attr('diff')
        @model.save_time()
        @next_roll?() && @next_roll()

    next_roll: ->
      window.location.hash = 'roll_success'

    playerGrid: (row, col, c_img, o_img, f1, f2) ->
      o_pos = Math.floor(Math.random() * (row * col))
      $grid = $('<table id="player_table"></table>')
      for  i in [0..row]
        $tr = $('<tr></tr>')
        $grid.append($tr)
        for j in [0..col]
          $td = $('<td></td>')
          $img = $('<img>').attr('src', c_img)
          $font = f1
          if (i * col + j) == o_pos
            $font = f2
            $img.attr('src', o_img)
            $td.attr('diff', true)
          $td.append $font
          $tr.append $td
      return $grid
