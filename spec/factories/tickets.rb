FactoryGirl.define do
  factory :ticket do
    registration_id "MyString"
    payment_gateway "MyString"
    payment_gateway_transaction_id "MyString"
    offer_price "9.99"
    sale_price "9.99"
    status "MyString"
    coupon ""
    workshop nil
    learner nil
  end
end
