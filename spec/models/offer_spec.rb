require 'rails_helper'

RSpec.describe Offer, type: :model do
  
  let(:invalid_start){
  	 Date.today + 3.days 
  }

  let(:invalid_end){
  	Date.today + 7.days 
  }

  it "fails vlidation with no start date of offer" do
  	offer = FactoryGirl.build(:offer, available_from: nil )
  	expect(offer).to_not be_valid
  end

  it "fails vlidation with no end date of offer" do
  	offer = FactoryGirl.build(:offer, available_to: nil )
  	expect(offer).to_not be_valid
  end

  it "fails validation for offer starting earlier than 5 days from today" do
  	offer = FactoryGirl.build(:offer, available_from: invalid_start )
  	expect(offer).to_not be_valid
  end

  it "fails validation for offer ending earlier than 10 days from start date" do
  	offer = FactoryGirl.build(:offer, available_to: invalid_end )
  	expect(offer).to_not be_valid
  end

end
