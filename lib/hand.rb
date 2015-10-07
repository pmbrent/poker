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

  def pair?
    values = fivecards.map { |x| x.value }
    return true if values.uniq.count == 4
    false
  end

  def two_pairs?
    values = fivecards.map { |x| x.value }
    return true if values.uniq.count == 3
    false
  end

  def triple?
    #return false if house || bomb
    values = fivecards.map { |x| x.value }
    values.each { |x| return true if values.count(x) == 3 }
    false
  end

  def straight?
    #return false if straight_flush
    sorted = fivecards.map { |x| x.value }.sort_by do |x|
      Deck::NUMBERS.index(x)
    end
    Deck::NUMBERS.join("").include?(sorted.join(""))
  end

  def flush?
    result = []
    suit = fivecards.first.suit
    return false if fivecards.drop(1).any? { |card| card.suit != suit }
    true
  end

  def house?   #assumes its not a bomb (ONLY check house if not bomb)
    #return false if bomb
    values = fivecards.map { |x| x.value }
    values.uniq.count == 2
  end

  def bomb?
    val = fivecards[0].value
    val2 = fivecards[1].value

    if val != val2
      fivecards.drop(2).all? { |x| x.value == val } ||
        fivecards.drop(2).all? { |x| x.value == val2 }
    else
      fivecards.drop(2).count { |x| x.value == val } == 2
    end

  end

  def straight_flush?
    result = []
    suit = fivecards.first.suit
    return false if fivecards.drop(1).any? { |card| card.suit != suit }

    sorted = fivecards.map { |x| x.value }.sort_by do |x|
      Deck::NUMBERS.index(x)
    end
    Deck::NUMBERS.join("").include?(sorted.join(""))

  end

  def royal_flush?
    result = []
    suit = fivecards.first.suit
    return false if fivecards.drop(1).any? { |card| card.suit != suit }

    royals = [10, :j, :q, :k, :a]
    fivecards.each { |card| return false unless royals.include?(card.value) }

    true
  end

  def beats(hand2)

    hand_types = [:royal_flush?, :straight_flush?, :bomb?, :house?,
                  :flush?, :straight?, :triple?, :two_pairs?, :pair?]

    hand_types.each do |method|
      if self.send(method) && !hand2.send(method)
        return true
      elsif hand2.send(method) && !self.send(method)
        return false
      elsif self.send(method) && hand2.send(method)
        return resolve_same_type(hand2, method)
      end

    end
    resolve_singles(hand2)
  end

  def resolve_same_type(hand2, type)
    # this will be fun
    false
  end

  def resolve_singles(hand2)
    values1 = fivecards.map { |x| x.value }.sort_by do |x|
      Deck::NUMBERS.index(x)
    end
    values2 = hand2.fivecards.map { |x| x.value }.sort_by do |x|
      Deck::NUMBERS.index(x)
    end
    values1.reverse!
    values2.reverse!

    (0..4).each do |idx|
      case values1[idx] <=> values2[idx]
      when -1
        return false
      when 0
        next
      when 1
        return true
      end
    end

    # what if it's a tie????
    false
  end

  private

end

# def logic
#   hand1 hand2
#   hand1.logic(hand2)
#   [hand1, hand2].select {|hand| hand.type == s f?}
