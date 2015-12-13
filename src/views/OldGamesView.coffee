class window.OldGamesView extends Backbone.View
  template: _.template '
   <div class="old-games"></div>
  '

  initialize: ->

    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    # @$el.append()
    # @$('.old-player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    # @$('.old-dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
