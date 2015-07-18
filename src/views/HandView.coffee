class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render() # create listeners for rerendering
    @render() # initial render

  render: ->
    @$el.children().detach() # reset listeners
    @$el.html @template @collection # re create html
    @$el.append @collection.map (card) -> # append collection of cards
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]

