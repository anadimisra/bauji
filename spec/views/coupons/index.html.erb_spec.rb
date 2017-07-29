require 'rails_helper'

RSpec.describe "coupons/index", type: :view do
  before(:each) do
    assign(:coupons, [
      Coupon.create!(
        :name => "Name",
        :voucher_code => "Voucher Code"
      ),
      Coupon.create!(
        :name => "Name",
        :voucher_code => "Voucher Code"
      )
    ])
  end

  it "renders a list of coupons" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Voucher Code".to_s, :count => 2
  end
end
