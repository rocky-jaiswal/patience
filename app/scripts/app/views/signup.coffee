define ["jquery", "underscore", "backbone", "handlebars", "text!../templates/signup.hbs"], ($, _, Backbone, Handlebars, signupTemplate) ->
  'use strict'
  
  class ContactView extends Backbone.View
    
    el: ".content"

    events:
      "submit #signup-form":  "handleSubmit"

    template: Handlebars.compile(signupTemplate)

    initialize: ->
      @render()

    render: ->
      $(@el).html(@template)
      $(".jumbotron").slideDown()
      $(".jumbotron").removeClass("hidden")

    handleSubmit: (e) ->
      e.preventDefault()
      unless $("#user-name").val() && $("#user-email").val()
        alert "Please provide you name and email"
      else
        $('input[type="submit"]').attr("disabled", "disabled");
        name = $("#user-name").val()
        email = $("#user-email").val()
        comments = $("#user-comments").val()
        @submitForm(name, email, comments)

    submitForm: (name, email, comments) ->
      $.ajax
        url: "https://api.mongolab.com/api/1/databases/patience/collections/users?apiKey=nVrJaUBoSsbTUhAJG60sFYya_SB-Kmyu"
        type: "POST"
        data: JSON.stringify({"name": name, "email": email, "comments": comments})
        contentType: "application/json"
        success: @handleSuccess

    handleSuccess: (data) =>
      @options.router.navigate("thanks", {trigger: true});