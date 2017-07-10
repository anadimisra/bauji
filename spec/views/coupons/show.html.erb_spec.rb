require 'rails_helper'

RSpec.describe "coupons/show", type: :view do
  before(:each) do
    @coupon = assign(:coupon, Coupon.create!(
      :code => "Code",
      :percentage => "9.99",
      :max_value => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
