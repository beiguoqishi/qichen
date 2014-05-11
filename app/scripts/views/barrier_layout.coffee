define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
   class BarrierLayoutView extends Backbone.View
    layout: JST['app/scripts/templates/barrier_layout.ejs']

    el: '#main'

    events:
      'click #player_table td': 'play'

    play:(e) ->
      $td = $(e.target)
      if $td.attr('diff')
        @model.save_time()
        @next_roll?() && @next_roll()

    render:() ->
      @$el.html(@layout(@model.toJSON()))

    playerGrid:(row,col,c_img,o_img,f1,f2) ->
      o_pos = Math.floor(Math.random() * (row * col))
      $grid = $('<table id="player_table"></table>')
      for  i in [0..row]
        $tr = $('<tr></tr>')
        $grid.append($tr)
        for j in [0..col]
          $td = $('<td></td>')
          $img = $('<img>').attr('src',c_img)
          $font = f1
          if (i * col + j) == o_pos
            $font = f2
            $img.attr('src',o_img)
            $td.attr('diff',true)
          $td.append $font
          $tr.append $td
      return $grid


