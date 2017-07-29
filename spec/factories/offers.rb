FactoryGirl.define do
  factory :offer do
    available_from { Date.today + 6.days }
    available_to { Date.today + 17.days }
  	association :coupon, factory: :coupon
    association :discount, factory: :discount
  end
end
