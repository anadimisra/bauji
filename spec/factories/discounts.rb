FactoryGirl.define do
  factory :discount do
    number 1
    valid_till "2017-07-09"
    active false
    workshop nil
    coupon nil
  end
end
