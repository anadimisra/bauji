require 'rails_helper'

RSpec.describe "discounts/index", type: :view do
  before(:each) do
    assign(:discounts, [
      Discount.create!(
        :number => 2,
        :active => false,
        :workshop => nil,
        :coupon => nil
      ),
      Discount.create!(
        :number => 2,
        :active => false,
        :workshop => nil,
        :coupon => nil
      )
    ])
  end

  it "renders a list of discounts" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
