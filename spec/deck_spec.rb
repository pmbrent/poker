require "deck"

describe Deck do
  let (:d ) {Deck.new}
  it "contains 52 cards" do
    expect(d.cards.size).to eq(52)
  end

  it "has 13 of each suit" do
    expect(d.cards.select{ |x| x.suit == :d }.size ).to eq(13)
  end

  it "has 4 of each value" do
    expect(d.cards.select{ |x| x.value == 4 }.size ).to eq(4)
  end

end
