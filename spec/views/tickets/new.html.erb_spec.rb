require 'rails_helper'

RSpec.describe "tickets/new", type: :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      :registration_id => "MyString",
      :payment_gateway => "MyString",
      :payment_gateway_transaction_id => "MyString",
      :offer_price => "9.99",
      :sale_price => "9.99",
      :status => "MyString",
      :coupon => "",
      :workshop => nil,
      :learner => nil
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "input[name=?]", "ticket[registration_id]"

      assert_select "input[name=?]", "ticket[payment_gateway]"

      assert_select "input[name=?]", "ticket[payment_gateway_transaction_id]"

      assert_select "input[name=?]", "ticket[offer_price]"

      assert_select "input[name=?]", "ticket[sale_price]"

      assert_select "input[name=?]", "ticket[status]"

      assert_select "input[name=?]", "ticket[coupon]"

      assert_select "input[name=?]", "ticket[workshop_id]"

      assert_select "input[name=?]", "ticket[learner_id]"
    end
  end
end
