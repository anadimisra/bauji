require 'rails_helper'

RSpec.describe Certification, :type => :model do

  it "should have all required validators" do
  	cert = build(:certification)
  	expect(cert.valid?).to be false 
	end

	it "should not allow city names less than 4 and more than 50 characters" do
		cert = build(:certification, name: "DevOps Foundation Certification", venue: "The Orchid Hotel" )
		expect(cert.valid?).to be false 
		expect([:city]).to eql(cert.errors.keys) 
	end

	it "should not allow less than 10 seats " do
		cert = build(:certification, seats: 5, name: "DevOps Foundation Certification", city: "Bangalore" ,venue: "The Orchid Hotel")
		expect(cert.valid?).to be false 
		expect([:seats]).to eql(cert.errors.keys)
	end

	it "should not allow more than 25 seats" do
		cert = build(:certification, seats: 35, name: "DevOps Foundation Certification", city: "Bangalore" ,venue: "The Orchid Hotel")
		expect(cert.valid?).to be false 
		expect([:seats]).to eql(cert.errors.keys)
	end

	it "should allow any seat capacity between 10 to 25" do
		cert= build(:certification, seats: 20, name: "DevOps Foundation Certification", city: "Bangalore" ,venue: "The Orchid Hotel")
		expect(cert.valid?).to be true 
	end
end