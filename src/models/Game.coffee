# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'count', 0
    @resetHands()
    # @getCount()
    @trigger('init')
    # console.log(@)

  # getCount: ->
  #   count = @get 'count'
  #   # playerHand = @get('playerHand')
  #   # dealerHard = @get('dealerHand')
  #   console.log(@get('dealerHand'))
  #   @get('playerHand').forEach((card)->
  #     val = card.get 'value'
  #     console.log(val) 
  #     if 2 <= val <= 6 then count++
  #     if 10 <= val <= 11 then count--
  #     console.log(count)
  #     )
  #   @get('dealerHand').forEach((card)-> 
  #     val = if card.get 'revealed' then card.get 'value' else 0
  #     console.log(val) 
  #     if 2 <= val <= 6 then count++
  #     if val == 10 or val == 1 then count--
  #     console.log(count)
  #     )
  #   @set 'count', count
  #   console.log('Count set', @get('count'))

  resetHands: ->
    # @on('change:count', ->
    #   @trigger
    #   )
    # @get('playerHand').on('add reset update all', => 
    #   @getCount()
    #   @trigger 'updateCount'
    #   )

    # @get('dealerHand').on 'add update all', => 
    #   # @getCount()
    #   @trigger 'updateCount'

    @get('dealerHand').on('bust', =>
      # console.log('dealer bust')
      @trigger('playerWin')
      setTimeout( => 
        alert('Dealer Bust')
      100)
      )
    
    @get('playerHand').on('bust', =>
      setTimeout( => 
        @trigger('dealerWin')
        alert('Player Bust')
      100)
      )

    player = @get('playerHand')
    dealer = @get('dealerHand')
    deck = @get('deck')
    self = @

    #console.log(@model)
    @get('dealerHand').on 'gameEnd', =>
      dealerScore = dealer.scores()
      playerScore = player.scores()
      if dealerScore > playerScore
        setTimeout( => 
          @trigger('dealerWin')
          alert('Dealer Wins')
        100)
      else if dealerScore < playerScore
        setTimeout( => 
          @trigger('playerWin')
          alert('Player Wins') 
        100)
      else
        setTimeout( => 
          alert('Push')
        100)