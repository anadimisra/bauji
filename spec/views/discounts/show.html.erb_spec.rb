require 'rails_helper'

RSpec.describe "discounts/show", type: :view do
  before(:each) do
    @discount = assign(:discount, Discount.create!(
      :registration_quantity => "",
      :discount_value => "9.99",
      :discount_percentage => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
