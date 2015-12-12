class window.AppView extends Backbone.View

  template: _.template '
    <div class="AppView"><div class="scores">Player Score Dealer Score</div></div>
  '
  initialize: ->
    @render()
    @on('change:game', @render())

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.AppView').append new GameView(model: @model.get 'game').el
    #@$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    #@$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
