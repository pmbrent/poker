require 'deck'

class Hand

  HANDS = [:none, :pair, :two_pairs, :triple, :straight,
          :flush, :house, :bomb, :straight_flush, :royal_flush]

  attr_accessor :deck, :fivecards
  attr_reader :type

  def initialize(deck = Deck.new)
    @deck = deck
    @fivecards = []
  end

  def draw(num = 5)
    deck.cards.shuffle
    num.times do
      fivecards << deck.cards.shift
    end
  end

  def straight
    sorted = fivecards.map { |x| x.value }.sort_by do |x|
      Deck::NUMBERS.index(x)
    end
    Deck::NUMBERS.join("").include?(sorted.join(""))
  end

  def flush
    result = []
    suit = fivecards.first.suit
    return false if fivecards.drop(1).any? { |card| card.suit != suit }
    true
  end

  def royal_flush
    result = []
    suit = fivecards.first.suit
    return false if fivecards.drop(1).any? { |card| card.suit != suit }

    royals = [10, :j, :q, :k, :a]
    fivecards.each { |card| return false unless royals.include?(card.value) }

    true
  end

  def straight_flush
    result = []
    suit = fivecards.first.suit
    return false if fivecards.drop(1).any? { |card| card.suit != suit }

    sorted = fivecards.map { |x| x.value }.sort_by do |x|
      Deck::NUMBERS.index(x)
    end
    Deck::NUMBERS.join("").include?(sorted.join(""))

  end

  private

  attr_writer :type

end

# def logic
#   hand1 hand2
#   hand1.logic(hand2)
#   [hand1, hand2].select {|hand| hand.type == s f?}
