require 'rails_helper'

RSpec.describe "discounts/new", type: :view do
  before(:each) do
    assign(:discount, Discount.new(
      :registration_quantity => "",
      :discount_value => "9.99",
      :discount_percentage => "9.99"
    ))
  end

  it "renders new discount form" do
    render

    assert_select "form[action=?][method=?]", discounts_path, "post" do

      assert_select "input[name=?]", "discount[registration_quantity]"

      assert_select "input[name=?]", "discount[discount_value]"

      assert_select "input[name=?]", "discount[discount_percentage]"
    end
  end
end
