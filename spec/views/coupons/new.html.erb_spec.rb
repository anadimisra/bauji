require 'rails_helper'

RSpec.describe "coupons/new", type: :view do
  before(:each) do
    assign(:coupon, Coupon.new(
      :code => "MyString",
      :percentage => "9.99",
      :max_value => "9.99"
    ))
  end

  it "renders new coupon form" do
    render

    assert_select "form[action=?][method=?]", coupons_path, "post" do

      assert_select "input[name=?]", "coupon[code]"

      assert_select "input[name=?]", "coupon[percentage]"

      assert_select "input[name=?]", "coupon[max_value]"
    end
  end
end
