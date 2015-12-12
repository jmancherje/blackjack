class window.App extends Backbone.Model
  initialize: ->
    @set 'game', game = new Game()
    @set 'money', 100
    @set 'playerScore', 0
    @set 'dealerScore', 0
    @set 'cardCount', 0
    # self = @
    # @get('game').on( 'playerWin', =>
    # )

    #@model.set('playerHand', @model.get('deck').dealPlayer())
    #@model.set('dealerHand', @model.get('deck').dealDealer())