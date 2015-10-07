require "Card"

describe Card do

  it "has a value" do
    expect(Card.new(9,:s).value).to eq(9)
  end

  it "has a suit" do
    expect(Card.new(9,:s).suit).to be(:s)
  end

end
