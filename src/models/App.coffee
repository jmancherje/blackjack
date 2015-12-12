class window.App extends Backbone.Model
  initialize: -> 
    @set 'game', game = new Game()
    @get('game').on( 'reset', ->
      console.log('reset')
      @set('game', game = new Game())
    )
    
    #@model.set('playerHand', @model.get('deck').dealPlayer())
    #@model.set('dealerHand', @model.get('deck').dealDealer())