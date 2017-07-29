require 'rails_helper'

RSpec.describe Discount, type: :model do
  
  it "fails validation for registration quantity less than one" do
  	discount = FactoryGirl.build(:discount, registration_quantity: 0)
  	expect(discount).to_not be_valid
  end

  it "fails validation for registration quantity more than five" do
  	discount = FactoryGirl.build(:discount, registration_quantity: 6)
  	expect(discount).to_not be_valid
  end

  it "fails validation for discount value of more than 9 thousand" do
  	discount = FactoryGirl.build(:discount, discount_value: 10000.00)
  	expect(discount).to_not be_valid
  end

  it "fails validation for discount of less than 5 percent" do
  	discount = FactoryGirl.build(:discount, discount_percentage: 0.04)
  	expect(discount).to_not be_valid
  end

  it "fails validation for discount of more than 25 percent" do
  	discount = FactoryGirl.build(:discount, discount_percentage: 0.30)
  	expect(discount).to_not be_valid
  end
  
end
