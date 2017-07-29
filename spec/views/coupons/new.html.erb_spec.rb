require 'rails_helper'

RSpec.describe "coupons/new", type: :view do
  before(:each) do
    assign(:coupon, Coupon.new(
      :name => "MyString",
      :voucher_code => "MyString"
    ))
  end

  it "renders new coupon form" do
    render

    assert_select "form[action=?][method=?]", coupons_path, "post" do

      assert_select "input[name=?]", "coupon[name]"

      assert_select "input[name=?]", "coupon[voucher_code]"
    end
  end
end
