require 'ffaker'

FactoryGirl.define do
  factory :order do
    order_id FFaker::Guid.guid
    gateway_transaction_id FFaker::Guid.guid
    order_value 125000.00
    factory :order_with_registrations do
    	after(:create) do |registration|
    		create_list(:registration, 1, order: order)
    	end
    end  
  end
end
