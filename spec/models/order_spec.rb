require 'rails_helper'

RSpec.describe Order, type: :model do
  
  it "fails validation for order value of less than 40 thousand" do
  	order = FactoryGirl.build(:order, order_value: 36000.00)
  	expect(order).to_not be_valid
  end

end
