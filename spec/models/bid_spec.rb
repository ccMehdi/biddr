require 'rails_helper'

RSpec.describe Bid, type: :model do
  def valid_attributes(new_attributes = {})
    {bid_amount:      "12.99"
   }.merge(new_attributes)
  end

  describe "Validations" do
    it "requires a bid ammount" do
      bid = Bid.new valid_attributes({bid_amount: nil})
      expect(bid).to be_invalid
    end
    
  end
end
