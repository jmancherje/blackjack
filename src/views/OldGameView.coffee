class window.OldGameView extends Backbone.View

  el: '<div class="single-old-game"></div>'

  initialize: ->
    @render()


  render: ->
    @$el.children().detach()
    # @$el.html @template()
    playerScore = @model.get('playerHand').scores()
    playerDiv = $("<div class=old-player-hand>Player Score: #{playerScore}</div><br>")

    playerDiv.append @model.get('playerHand').map (card) ->
      new CardView(model: card).$el
    dealerScore = @model.get('dealerHand').scores()
    dealerDiv = $("<div class=old-dealer-hand>Dealer Score: #{dealerScore}</div><br>")
    console.log('dealerHand', @model.get('dealerHand'))
    dealerDiv.append @model.get('dealerHand').map (card) ->
      new CardView(model: card).$el
    console.log('playerDiv', playerDiv)
    @$el.append(playerDiv)
    @$el.append(dealerDiv)
    $('.old-games').append(@$el)
      # new CardView(model: card).$el
    # @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    # @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
