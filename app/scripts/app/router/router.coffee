define ["jquery", "backbone", "app/views/about", "app/views/contact", "app/views/home", "app/views/signup", "app/views/thanks"], ($, Backbone, AboutView, ContactView, HomeView, SignupView, ThanksView) ->
 
  class AppRouter extends Backbone.Router
    
    routes:
      ""         : "home"
      "about"    : "about"
      "contact"  : "contact"
      "home"     : "home"
      "signup"   : "signup" 
      "thanks"   : "thanks" 

    home: ->
      new HomeView()

    about: ->
      new AboutView()

    contact: ->
      new ContactView()

    signup: ->
      new SignupView({router: @})

    thanks: ->
      new ThanksView()
