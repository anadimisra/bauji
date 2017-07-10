require 'rails_helper'

RSpec.describe "discounts/new", type: :view do
  before(:each) do
    assign(:discount, Discount.new(
      :number => 1,
      :active => false,
      :workshop => nil,
      :coupon => nil
    ))
  end

  it "renders new discount form" do
    render

    assert_select "form[action=?][method=?]", discounts_path, "post" do

      assert_select "input[name=?]", "discount[number]"

      assert_select "input[name=?]", "discount[active]"

      assert_select "input[name=?]", "discount[workshop_id]"

      assert_select "input[name=?]", "discount[coupon_id]"
    end
  end
end
