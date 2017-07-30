require 'ffaker'

FactoryGirl.define do
  factory :order do
    order_id FFaker::Guid.guid
    gateway_transaction_id FFaker::Guid.guid
    order_value 125000.00
    transaction_status "init"
    payment_gateway "ccavenue"
    factory :order_with_registrations do
    	after(:build) do |registration|
    		create_list(:registration, 1, order: order)
    	end
    end  
  end
end
