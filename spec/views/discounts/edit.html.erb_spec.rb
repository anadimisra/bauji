require 'rails_helper'

RSpec.describe "discounts/edit", type: :view do
  before(:each) do
    @discount = assign(:discount, Discount.create!(
      :registration_quantity => "",
      :discount_value => "9.99",
      :discount_percentage => "9.99"
    ))
  end

  it "renders the edit discount form" do
    render

    assert_select "form[action=?][method=?]", discount_path(@discount), "post" do

      assert_select "input[name=?]", "discount[registration_quantity]"

      assert_select "input[name=?]", "discount[discount_value]"

      assert_select "input[name=?]", "discount[discount_percentage]"
    end
  end
end
