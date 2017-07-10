require 'rails_helper'

RSpec.describe "tickets/index", type: :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        :registration_id => "Registration",
        :payment_gateway => "Payment Gateway",
        :payment_gateway_transaction_id => "Payment Gateway Transaction",
        :offer_price => "9.99",
        :sale_price => "9.99",
        :status => "Status",
        :coupon => "",
        :workshop => nil,
        :learner => nil
      ),
      Ticket.create!(
        :registration_id => "Registration",
        :payment_gateway => "Payment Gateway",
        :payment_gateway_transaction_id => "Payment Gateway Transaction",
        :offer_price => "9.99",
        :sale_price => "9.99",
        :status => "Status",
        :coupon => "",
        :workshop => nil,
        :learner => nil
      )
    ])
  end

  it "renders a list of tickets" do
    render
    assert_select "tr>td", :text => "Registration".to_s, :count => 2
    assert_select "tr>td", :text => "Payment Gateway".to_s, :count => 2
    assert_select "tr>td", :text => "Payment Gateway Transaction".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
