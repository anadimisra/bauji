require 'rails_helper'

RSpec.describe "discounts/edit", type: :view do
  before(:each) do
    @discount = assign(:discount, Discount.create!(
      :number => 1,
      :active => false,
      :workshop => nil,
      :coupon => nil
    ))
  end

  it "renders the edit discount form" do
    render

    assert_select "form[action=?][method=?]", discount_path(@discount), "post" do

      assert_select "input[name=?]", "discount[number]"

      assert_select "input[name=?]", "discount[active]"

      assert_select "input[name=?]", "discount[workshop_id]"

      assert_select "input[name=?]", "discount[coupon_id]"
    end
  end
end
