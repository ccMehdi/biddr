require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :title => "MyString",
      :detail => "MyText",
      :price => 1,
      :user => nil
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_title[name=?]", "item[title]"

      assert_select "textarea#item_detail[name=?]", "item[detail]"

      assert_select "input#item_price[name=?]", "item[price]"

      assert_select "input#item_user_id[name=?]", "item[user_id]"
    end
  end
end
