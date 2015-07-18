class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> new Hand [@pop(), @pop()], @ # deal two cards initially, both revealed

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true # one revealed card and one hidden one

