class window.AppView extends Backbone.View

  template: _.template '
    <div class="AppView"><div class="scores">Player Score: <%= playerScore %> Dealer Score: <%= dealerScore %> Hi/Low Count: <%= cardCount %> </div></div>
  '
  initialize: ->
    @render()
    @model.on('change:game', @render, this)
    @model.get('game').on('change:count', =>  
      console.log('change in game count')
      console.log('game: ', @model.get('game').get('count'))
      currentCount = @model.get 'cardCount'
      currentCount += @model.get('game').get('count')
      @model.set 'cardCount', currentCount
      console.log('app: ',@model.get('cardCount'))
      @render()
      )
    # @model.get('game').dealerHand.on('add', => @set 'cardCount',  )

    # @model.get('game').on('updateCount', =>
    #   console.log('update count trigger from game')
    #   currentCount = @model.get 'cardCount'
    #   currentCount += @model.get('game').get('count')
    #   @model.set 'cardCount', currentCount
    #   @render()
    #   )
    @model.get('game').on('dealerWin', => 
      #console.log(@model.get('game'))
      @model.set('dealerScore', @model.get('dealerScore')+1)
      @render()
      )
    @model.get('game').on('playerWin', => 
      @model.set('playerScore', @model.get('playerScore')+1)
      @render()
      )

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$('.AppView').append new GameView(model: @model.get 'game').el
    #@$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    #@$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
