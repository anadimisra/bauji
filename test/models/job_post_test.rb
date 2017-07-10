require 'rails_helper'

RSpec.describe JobPost, :type => :model do
  
  it "should have all validators" do
  	job = build(:job_post)
  	expect(job.valid?).to be false
  end

  it "does not allow job vacancy name of less than 10 characters" do
  	job = build(:job_post, location: "Bangalore")
  	expect(job.valid?).to be false
  	expect([:name]).to eql(job.errors.keys)
  end

  it "does not allow location name of less than 4 characters" do
  	job = build(:job_post, name: "DevOps Automation Engineer", location: "Bangalore")
  end
  
end
