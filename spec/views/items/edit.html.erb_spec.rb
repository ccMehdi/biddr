require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :title => "MyString",
      :detail => "MyText",
      :price => 1,
      :user => nil
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_title[name=?]", "item[title]"

      assert_select "textarea#item_detail[name=?]", "item[detail]"

      assert_select "input#item_price[name=?]", "item[price]"

      assert_select "input#item_user_id[name=?]", "item[user_id]"
    end
  end
end
