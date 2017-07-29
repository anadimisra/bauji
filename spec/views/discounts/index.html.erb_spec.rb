require 'rails_helper'

RSpec.describe "discounts/index", type: :view do
  before(:each) do
    assign(:discounts, [
      Discount.create!(
        :registration_quantity => "",
        :discount_value => "9.99",
        :discount_percentage => "9.99"
      ),
      Discount.create!(
        :registration_quantity => "",
        :discount_value => "9.99",
        :discount_percentage => "9.99"
      )
    ])
  end

  it "renders a list of discounts" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
