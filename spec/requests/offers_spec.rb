require 'rails_helper'

RSpec.describe "Offers", type: :request do
  
  describe "gives voucher code and discount value" do

  	it "when searched by voucher_code" do
  		offer = Offer.new
  		Timecop.freeze(Date.today - 12.days) do
  			offer = FactoryGirl.create(:offer)
  		end
  		get "/vouchers/#{offer.coupon.voucher_code}", as: :json
  		expect(response).to be_success
  		expect(json[0]['voucher_code']).to eql offer.coupon.voucher_code
  	end
  end

  describe "gives not found response" do

  	it "when available limit exhausts before date till available" do
  		offer = Offer.new
  		Timecop.freeze(Date.today - 12.days) do
  			offer = FactoryGirl.create(:offer)
  		end
  		payload = FactoryGirl.attributes_for(:offer, :available_limit => 0, :discount_id => offer.discount.id, :coupon_id => offer.coupon.id)
  		sign_in
  		put "/offers/#{offer.id}", params: { id: offer.id, offer: payload }, as: :json
  		get "/vouchers/#{offer.coupon.voucher_code}", as: :json
  		expect(response.status).to eq 404
  	end
  end
end