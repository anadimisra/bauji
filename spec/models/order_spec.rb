require 'rails_helper'

RSpec.describe Order, type: :model do
  
  it "fails validation for order value of less than 36 thousand" do
  	order = FactoryGirl.build(:order, order_value: 35000.00)
  	expect(order).to_not be_valid
  end
end