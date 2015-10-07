require 'hand'

describe Hand do
  let(:hand) { Hand.new }

  let(:card1) { double(:card1) }
  let(:card2) { double(:card2) }
  let(:card3) { double(:card3) }
  let(:card4) { double(:card4) }
  let(:card5) { double(:card5) }

  describe "#draw" do

    it "draws 5 cards by default" do
      hand.draw
      expect(hand.fivecards.size).to eq(5)
    end

    it "can draw a given number of cards" do
      hand.draw(3)
      expect(hand.fivecards.size).to eq(3)
    end

    it "draws 5 unique cards" do
      hand.draw
      expect(hand.fivecards.uniq).to eq(hand.fivecards)
    end

  end

  describe "#matches" do

    # it "detects all cards with matching values" do
    #
    #   allow(card1).to receive(:value).and_return(5)
    #   allow(card2).to receive(:value).and_return(3)
    #   allow(card3).to receive(:value).and_return(3)
    #   allow(card4).to receive(:value).and_return(5)
    #   allow(card5).to receive(:value).and_return(:q)
    #   hand.fivecards = [card1, card2, card3, card4, card5]
    #
    #   expect(hand.matches).to include(card1, card4, card2, card3)
    #   expect(hand.matches.count).to eq(4)
    #
    # end

  end

  describe "#pair" do
    # before do
    #   allow(card1).to receive(:value).and_return(5)
    #   allow(card2).to receive(:value).and_return(3)
    #   allow(card4).to receive(:value).and_return(4)
    #   allow(card5).to receive(:value).and_return(:q)
    # end
    #
    # it "detects a pair" do
    #   allow(card3).to receive(:value).and_return(3)
    #   hand.fivecards = [card1, card2, card3, card4, card5]
    #
    #   hand.pair
    #   expect(hand.type).to eq(:pair)
    # end
    #
    # it "returns nil if no pair" do
    #   allow(card3).to receive(:value).and_return(6)
    #   hand.fivecards = [card1, card2, card3, card4, card5]
    #
    #   expect(hand.pair).to eq(nil)
    # end

  end

  describe "#two_pairs" do

    it "detects two pairs"
    it "does not run if there are no pairs"

  end

  describe "#triple" do

    it "detects three of a kind"
    it "returns nil if no pair"

  end

  describe "#straight" do
    before do
      allow(card1).to receive(:value).and_return(9)
      allow(card2).to receive(:value).and_return(10)
      allow(card3).to receive(:value).and_return(8)
      allow(card4).to receive(:value).and_return(:q)
    end

    it "detects a straight" do
      allow(card5).to receive(:value).and_return(:j)
      hand.fivecards = [card1, card2, card3, card4, card5]

      expect(hand.straight).to be(true)
    end


    it "returns nil if no straight" do
      allow(card5).to receive(:value).and_return(2)
      hand.fivecards = [card1, card2, card3, card4, card5]

      expect(hand.straight).to be(false)
    end

  end

  describe "#flush" do

    before do
      allow(card1).to receive(:suit).and_return(:d)
      allow(card2).to receive(:suit).and_return(:d)
      allow(card3).to receive(:suit).and_return(:d)
      allow(card4).to receive(:suit).and_return(:d)
    end

    it "detects a flush" do
      allow(card5).to receive(:suit).and_return(:d)
      hand.fivecards = [card1, card2, card3, card4, card5]

      expect(hand.flush).to be(true)
    end

    it "returns nil if no flush" do
      allow(card5).to receive(:suit).and_return(:s)
      hand.fivecards = [card1, card2, card3, card4, card5]

      expect(hand.flush).to be(false)
    end

  end

  describe "#house" do

    it "detects a house"
    it "returns nil if no house"

  end

  describe "#bomb" do

    it "detects a bomb"
    it "returns nil if no bomb"

  end

  describe "#straight_flush" do

    it "detects a straight flush" do
      allow(card1).to receive(:value).and_return(9)
      allow(card2).to receive(:value).and_return(10)
      allow(card3).to receive(:value).and_return(:k)
      allow(card4).to receive(:value).and_return(:q)
      allow(card5).to receive(:value).and_return(:j)
      allow(card1).to receive(:suit).and_return(:d)
      allow(card2).to receive(:suit).and_return(:d)
      allow(card3).to receive(:suit).and_return(:d)
      allow(card4).to receive(:suit).and_return(:d)
      allow(card5).to receive(:suit).and_return(:d)
      hand.fivecards = [card1, card2, card3, card4, card5]

      expect(hand.straight_flush).to be(true)
    end

    it "returns false if no straight flush" do
      hand.draw
      hand.fivecards[0] = hand.fivecards[1]
      expect(hand.straight_flush).to be(false)
    end
  end

  describe "#royal_flush" do

    it "detects a royal flush" do
      allow(card1).to receive(:value).and_return(:a)
      allow(card2).to receive(:value).and_return(:q)
      allow(card3).to receive(:value).and_return(:k)
      allow(card4).to receive(:value).and_return(:j)
      allow(card5).to receive(:value).and_return(10)
      allow(card1).to receive(:suit).and_return(:d)
      allow(card2).to receive(:suit).and_return(:d)
      allow(card3).to receive(:suit).and_return(:d)
      allow(card4).to receive(:suit).and_return(:d)
      allow(card5).to receive(:suit).and_return(:d)
      hand.fivecards = [card1, card2, card3, card4, card5]

      expect(hand.royal_flush).to be(true)
    end

    it "returns false if no royal flush" do
      hand.draw
      hand.fivecards[0] = hand.fivecards[1]
      expect(hand.royal_flush).to be(false)
    end


  end

  describe "#beats" do

    it "correctly compares a bomb and a pair"
    it "correctly compares two bombs"
    it "correctly compares two straights"
    it "correctly compares two flushes"
    it "correctly compares two royal flushes"

  end


end
