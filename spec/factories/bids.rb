FactoryGirl.define do

  factory :bid do
    association :item, factory: :item
    association :user, factory: :user
    bid_amount "MyString"
  end

end
