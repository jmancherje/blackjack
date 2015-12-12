class window.App extends Backbone.Model
  initialize: ->
    @set 'game', game = new Game()
    # self = @
    # @get('game').on( 'reset', =>
    #   console.log('App Model, reset heard')
    #   @set 'game', game = new Game()
    #   console.log(self)
    # )

    #@model.set('playerHand', @model.get('deck').dealPlayer())
    #@model.set('dealerHand', @model.get('deck').dealDealer())