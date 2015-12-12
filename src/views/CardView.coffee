class window.CardView extends Backbone.View
  className: 'card'

  template: _.template ''

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    # console.log(@model.attributes.suitName)
    @$el.html @template @model.attributes
    # console.log(@model.attributes)
    @$el.css('background', "url(img/cards/#{@model.attributes.rankName}-#{@model.attributes.suitName}.png")
    # @$el.append("<img src=\"img/cards/#{@model.attributes.rankName}-#{@model.attributes.suitName}.png\" />")
    @$el.addClass 'covered' unless @model.get 'revealed'

