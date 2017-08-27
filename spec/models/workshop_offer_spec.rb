require 'rails_helper'

RSpec.describe WorkshopOffer, type: :model do
  it "allows reusing offers for workshop" do
  	offer = FactoryGirl.create(:offer)
  	workshop = FactoryGirl.create(:workshop)
  	wo = WorkshopOffer.new
  	wo.offer = offer
  	wo.workshop = workshop
  	expect{ wo.save }.to change(WorkshopOffer, :count).by(1)
	end
end
