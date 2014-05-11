#/*global require*/
'use strict'

require.config
  shim: 
    bootstrap:
      deps: ['jquery'],
      exports: 'jquery'
  paths:
    jquery: '../bower_components/jquery/dist/jquery'
    backbone: '../bower_components/backbone/backbone'
    underscore: '../bower_components/underscore/underscore'
    bootstrap: '../bower_components/sass-bootstrap/dist/js/bootstrap'
    store   : '../bower_components/store-js/store'
    app      : 'routes/app'

require [
  'backbone','app'
], (Backbone,App) ->
  new App

  Backbone.history.start()
