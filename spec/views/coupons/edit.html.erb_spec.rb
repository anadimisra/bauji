require 'rails_helper'

RSpec.describe "coupons/edit", type: :view do
  before(:each) do
    @coupon = assign(:coupon, Coupon.create!(
      :code => "MyString",
      :percentage => "9.99",
      :max_value => "9.99"
    ))
  end

  it "renders the edit coupon form" do
    render

    assert_select "form[action=?][method=?]", coupon_path(@coupon), "post" do

      assert_select "input[name=?]", "coupon[code]"

      assert_select "input[name=?]", "coupon[percentage]"

      assert_select "input[name=?]", "coupon[max_value]"
    end
  end
end
