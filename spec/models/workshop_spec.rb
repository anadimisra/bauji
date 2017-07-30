require 'rails_helper'

RSpec.describe Workshop, type: :model do

  let(:invalid_start){
  	 Date.today + 3.days 
  }

  let(:invalid_end){
  	Date.today + 52.days 
  }

  it "fails validation for workshop starting earlier than 45 days from today" do
  	workshop = FactoryGirl.build(:workshop, starts_on: invalid_start )
  	expect(workshop).to_not be_valid
  end

  it "fails validation for workshop with end date greater than next day from start date" do
  	workshop = FactoryGirl.build(:workshop, ends_on: invalid_end )
  	expect(workshop).to_not be_valid
  end

  it "uses certification name as part of slug" do
    workshop = FactoryGirl.create(:workshop)
    expected_slug = workshop.certification.name.gsub(" ","-").downcase << "-" << workshop.city.downcase.gsub(" ","-") << "-" << workshop.starts_on.to_s
    expect(workshop.slug).to eql(expected_slug)
  end
end
