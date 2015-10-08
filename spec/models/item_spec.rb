require 'rails_helper'

RSpec.describe Item, type: :model do
  def valid_attributes(new_attributes = {})
    {title:            "My Item For sale",
     detail:           "hgf jagfjs gfjgsf jgs fjgsjd f",
     end_date:         "2015-10-02",

   }.merge(new_attributes)
  end

  describe "Validations" do
    it "requires a title" do
      item = Item.new valid_attributes({title: nil})
      expect(item).to be_invalid
    end

    it "requires a detail" do
      item = Item.new valid_attributes({detail: nil})
      expect(item).to be_invalid
    end

    it "requires a end date" do
      item = Item.new valid_attributes({end_date: nil})
      expect(item).to be_invalid
    end
  end
end
