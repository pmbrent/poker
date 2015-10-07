require "card"

class Deck

  NUMBERS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :j, :q, :k, :a]

  attr_accessor :cards

  def initialize
    @cards = make_cards
  end

  private

  def make_cards
    cards = []
    suits = [:d, :c, :h, :s]

    suits.each do |suit|
      NUMBERS.each do |value|
        cards << Card.new(value, suit)
      end
    end

    cards
  end

end
