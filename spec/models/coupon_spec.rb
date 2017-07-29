require 'rails_helper'

RSpec.describe Coupon, type: :model do
  
  it "fails validation for coupon name smaller than 10 characters" do
  	coupon = FactoryGirl.build(:coupon, name: "foo")
  	expect(coupon).to_not be_valid
  end

  it "fails validation for voucher code less than 5 characters" do
  	coupon = FactoryGirl.build(:coupon, voucher_code: "foo")
  	expect(coupon).to_not be_valid
  end

  it "fails validation for voucher code more than 10 characters" do
  	coupon = FactoryGirl.build(:coupon, voucher_code: "foofoofoofoo")
  	expect(coupon).to_not be_valid
  end
  
end
