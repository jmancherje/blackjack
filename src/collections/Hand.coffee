class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if @isDealer
      # id = setInterval(->
      # @add(@deck.pop())
      # if @minScore() >17
      #   clearInterval(id)
      # 1000)

      while(@scores()< 17)
        @add(@deck.pop())
      if (@scores()> 21)
        @trigger('bust')
      else
        @trigger('gameEnd')

    else
      @add(@deck.pop())
      if (@scores()> 21)
        @trigger('bust')
        #console.log('player over 21')

  stand: ->
    @trigger('stood')

  dealerStart: ->
    console.log('dealer start')
    @at(0).flip()
    if @scores()< 17
      @hit()
    else
      @trigger('gameEnd')

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  # getCount: ->  
  #   count = 0
  #   @reduce (score, card) ->
  #     console.log(score);
  #     cardValue = if card.get 'revealed' then card.get 'value' else 0
  #     if 2 <= cardValue <= 6 then count++
  #     if 10 <= cardValue <= 11 then count--
  #     score += cardValue
  #   , 0
  #   @set 'count', count
  #   count

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    min = @minScore()
    max = @minScore() + 10 * @hasAce()
    if max > 21
      return min
    else
      max
    # [@minScore(), @minScore() + 10 * @hasAce()]
  reRender: ->
    @trigger('renderHand')
    console.log('reRender from hand model')
