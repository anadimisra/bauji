require 'rails_helper'

RSpec.describe Certification, type: :model do
  	
  	it "does not allow to update name" do
  		cert = FactoryGirl.create(:certification)
  		cert.name = "Name Change Try"
  		cert.update(cert.serializable_hash)
  		expect(cert.errors[:name].size).to eq 1
  	end
end
