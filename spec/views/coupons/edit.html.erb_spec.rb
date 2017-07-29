require 'rails_helper'

RSpec.describe "coupons/edit", type: :view do
  before(:each) do
    @coupon = assign(:coupon, Coupon.create!(
      :name => "MyString",
      :voucher_code => "MyString"
    ))
  end

  it "renders the edit coupon form" do
    render

    assert_select "form[action=?][method=?]", coupon_path(@coupon), "post" do

      assert_select "input[name=?]", "coupon[name]"

      assert_select "input[name=?]", "coupon[voucher_code]"
    end
  end
end
