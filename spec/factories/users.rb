FactoryGirl.define do
  factory :user do
    sequence(:email_address)      {|n| "#{n}-#{Faker::Internet.email}" }
    password                      Faker::Internet.password
  end

end
