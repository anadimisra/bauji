require 'rails_helper'

RSpec.describe "tickets/show", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :registration_id => "Registration",
      :payment_gateway => "Payment Gateway",
      :payment_gateway_transaction_id => "Payment Gateway Transaction",
      :offer_price => "9.99",
      :sale_price => "9.99",
      :status => "Status",
      :coupon => "",
      :workshop => nil,
      :learner => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Registration/)
    expect(rendered).to match(/Payment Gateway/)
    expect(rendered).to match(/Payment Gateway Transaction/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
