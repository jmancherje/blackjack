# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('dealerHand').on('bust', ->
      # console.log('dealer bust')
      setTimeout( -> 
        alert('Dealer Bust')
      100)
      )
    
    @get('playerHand').on('bust', ->
      setTimeout( -> 
        alert('Player Bust')
      100)
      )

    player = @get('playerHand')
    dealer = @get('dealerHand')
    deck = @get('deck')
    self = @

    #console.log(@model)
    @get('dealerHand').on 'gameEnd', ->
      dealerScore = dealer.scores()
      playerScore = player.scores()
      if dealerScore > playerScore
        setTimeout( -> 
          alert('Dealer Wins')
        100)
      else if dealerScore < playerScore
        setTimeout( -> 
          alert('Player Wins') 
        100)
      else
        setTimeout( -> 
          alert('Push')
        100)

  resetHands: ->
    @get('dealerHand').on('bust', ->
      # console.log('dealer bust')
      setTimeout( -> 
        alert('Dealer Bust')
      100)
      )
    
    @get('playerHand').on('bust', ->
      setTimeout( -> 
        alert('Player Bust')
      100)
      )

    player = @get('playerHand')
    dealer = @get('dealerHand')
    deck = @get('deck')
    self = @

    #console.log(@model)
    @get('dealerHand').on 'gameEnd', ->
      dealerScore = dealer.scores()
      playerScore = player.scores()
      if dealerScore > playerScore
        setTimeout( -> 
          alert('Dealer Wins')
        100)
      else if dealerScore < playerScore
        setTimeout( -> 
          alert('Player Wins') 
        100)
      else
        setTimeout( -> 
          alert('Push')
        100)