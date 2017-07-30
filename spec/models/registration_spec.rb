require 'rails_helper'

RSpec.describe Registration, type: :model do
  
  it "saves registration details with valid learner, workshop and order" do
  	registration = Registration.create! FactoryGirl.build(:registration).serializable_hash	
  	expect(registration.order.order_value).to eql 125000.00
	end
end
