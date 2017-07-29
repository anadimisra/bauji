require 'rails_helper'

RSpec.describe "offers/new", type: :view do
  before(:each) do
    assign(:offer, Offer.new(
      :discount => nil,
      :coupon => nil
    ))
  end

  it "renders new offer form" do
    render

    assert_select "form[action=?][method=?]", offers_path, "post" do

      assert_select "input[name=?]", "offer[discount_id]"

      assert_select "input[name=?]", "offer[coupon_id]"
    end
  end
end
