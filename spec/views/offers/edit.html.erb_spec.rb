require 'rails_helper'

RSpec.describe "offers/edit", type: :view do
  before(:each) do
    @offer = assign(:offer, Offer.create!(
      :discount => nil,
      :coupon => nil
    ))
  end

  it "renders the edit offer form" do
    render

    assert_select "form[action=?][method=?]", offer_path(@offer), "post" do

      assert_select "input[name=?]", "offer[discount_id]"

      assert_select "input[name=?]", "offer[coupon_id]"
    end
  end
end
