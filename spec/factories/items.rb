FactoryGirl.define do
  factory :item do
    association :user, factory: :user
    title "MyString"
    detail "MyText"
    end_date "2015-10-02"
    reserved_price 1
  end

end
