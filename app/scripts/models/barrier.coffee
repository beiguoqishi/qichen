define [
  'underscore'
  'backbone'
  'store'
], (_, Backbone,store) ->
  'use strict';

  class BarrierModel extends Backbone.Model
    url: '',

    initialize: () ->
      @sync_from_store()

    defaults:
      show_rank:false
      time: 0
      row:11
      col:8
      roll_num:1,
      roll:'一',
      next_roll:'进入第二关'
      f1:'大'
      f2:'太'

    sync_from_store:->
      @set $.extend({},store.get('time') || {})

    to_begin:->
      time = store.get('time')
      !(time && time.complete_roll >= 1)

    start_game: ()->
      m =
        roll_num:1,
        show_rank:false
        roll:'一',
        next_roll:'进入第二关'
        f1:'大'
        f2:'太'
      store.set('time', $.extend({
        begin_time: new Date().getTime(),
        time : 0,
      },m))
      @set $.extend({time:0},m)
      window.location.hash = 'barrier'
      this

    save_time: () ->
      clearInterval(window.timeout)
      time = store.get('time') || {}
      time['time'] = @time
      time['complete_roll'] = time.roll_num
      @set('time',@time)
      store.set('time',time)
      @update_roll()
      @sync_from_store()

    update_roll: ()->
      time = store.get('time') || {}
      roll_num = parseInt(time.roll_num) || 1
      m = {}
      complete_roll = parseInt(time.complete_roll)
      switch roll_num
        when 1
          if complete_roll is 1
            m.roll_num = 2
            m.roll = '二'
            m.next_roll = '进入第二关'
            m.f1='省'
            m.f2='溴'
        when 2
          if complete_roll is 2
            m.roll_num = 3
            m.roll = '三'
            m.next_roll = '进入第三关'
            m.f1='巧'
            m.f2='戈'
        when 3
          if complete_roll is 3
            m.roll_num = 4
            m.next_roll = '点击查看排名'

      $.extend time,m
      store.set('time',time)

    timing:() ->
      clearInterval(window.timeout)
      time = store.get('time')
      if !(time && parseInt(time.time) >= 0)
        store.set('time',{
          begin_time:new Date().getTime()
          time:0
        })
        time = store.get('time')
      self = @
      self.time = time.time
      window.timeout = setInterval ()->
        $('.seconds').text(++self.time)
      ,1000
      this

