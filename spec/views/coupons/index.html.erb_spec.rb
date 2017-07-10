require 'rails_helper'

RSpec.describe "coupons/index", type: :view do
  before(:each) do
    assign(:coupons, [
      Coupon.create!(
        :code => "Code",
        :percentage => "9.99",
        :max_value => "9.99"
      ),
      Coupon.create!(
        :code => "Code",
        :percentage => "9.99",
        :max_value => "9.99"
      )
    ])
  end

  it "renders a list of coupons" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
