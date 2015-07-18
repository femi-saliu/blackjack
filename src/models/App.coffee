class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'bust',  =>@trigger 'dealerWin'
    @get('playerHand').on 'stand', => @get('dealerHand').playToWin()
    @get('dealerHand').on 'bust', => @trigger 'playerWin'
    @get('dealerHand').on 'stand', => @decideWinner()

  decideWinner: ->
    console.log(@get('playerHand').maxScore())
    console.log(@get('dealerHand').maxScore())
    if @get('playerHand').maxScore() > @get('dealerHand').maxScore()
        @trigger 'playerWin'
    else if @get('playerHand').maxScore() < @get('dealerHand').maxScore()
        @trigger 'dealerWin'
    else
        @trigger 'push'
