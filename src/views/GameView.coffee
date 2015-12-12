class window.GameView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="reset-button">Reset</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('dealerHand').dealerStart()
    'click .reset-button': ->
      console.log('Game View triggered reset event')
      #@model.trigger('reset')
      @model.set 'playerHand', @model.get('deck').dealPlayer()
      @model.set 'dealerHand', @model.get('deck').dealDealer()
      @model.resetHands()
      @renderHands()
      if @model.get('deck').length < 10
        setTimeout( ->
          alert('Shuffeling deck')
        100)
        @model.set 'deck', deck = new Deck()
      # @model.get('playerHand').reRender()
      # @model.get('dealerHand').reRender()
      # console.log(@model.get('playerHand'))


  initialize: ->
    @render()
    # console.log(@)
    # @model.on 'change:game', => @render(), this

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  renderHands: ->
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el