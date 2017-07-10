require 'rails_helper'

RSpec.describe "discounts/show", type: :view do
  before(:each) do
    @discount = assign(:discount, Discount.create!(
      :number => 2,
      :active => false,
      :workshop => nil,
      :coupon => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
