require 'rails_helper'

RSpec.describe "Workshops", type: :request do
  describe "JSON request" do

    it "lists all workshops without authentication" do
    	FactoryGirl.create(:workshop)
      get "/workshops", as: :json
      expect(response).to be_success
    end

    it "lists a workshops without authentication" do
    	workshop = FactoryGirl.create(:workshop)
  		get "/workshops/#{workshop.id.to_s}", as: :json
    	expect(response).to be_success
    	expect(json['venue']).to eql workshop.venue
    end
  end

  describe "denies public access" do

  	it "to new workshop form" do
  		get new_job_post_path
  		expect(response).to redirect_to new_user_session_path
  	end

  	it "for creating workshop" do
  		workshop_attributes = FactoryGirl.attributes_for :workshop 
  		expect {
  			post "/workshops", params: { workshop: workshop_attributes }
  		}.to_not change(Workshop, :count)

  		expect(response).to redirect_to new_user_session_path
  	end
  end

  describe "allows logged in user" do

    it "to create workshop for a certification" do
      sign_in
      certification = FactoryGirl.create(:certification)
  		workshop_attributes = FactoryGirl.attributes_for :workshop
  		workshop_attributes[:certification_id] = certification.id
  		expect {
  			post "/workshops", params: { workshop: workshop_attributes }
  		}.to change(Workshop, :count).by(1)

      expect(response).to redirect_to(Workshop.last)
    end    
  end
end
