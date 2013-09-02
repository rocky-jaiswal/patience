define ["jquery", "underscore", "backbone", "handlebars", "text!../templates/thanks.hbs"], ($, _, Backbone, Handlebars, thanksTemplate) ->
  'use strict'
  
  class ContactView extends Backbone.View
    
    el: ".content"

    template: Handlebars.compile(thanksTemplate)

    initialize: ->
      @render()

    render: ->
      $(@el).html(@template)
      $(".jumbotron").slideDown()
      $(".jumbotron").removeClass("hidden")