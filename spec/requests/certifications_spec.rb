require 'rails_helper'

RSpec.describe "Certifications", type: :request do

  describe "JSON request" do

    it "lists all certifications without authentication" do
    	FactoryGirl.create(:certification)
      get "/certifications", as: :json
      expect(response).to be_success
    end

    it "lists a certification without authentication" do
    	cert = FactoryGirl.create(:certification)
  		get "/certifications/#{cert.id.to_s}", as: :json
    	expect(response).to be_success
    	expect(json['name']).to eql cert.name
    end
  end

  describe "denies public access" do

  	it "to new certification form" do
  		get new_certification_path
  		expect(response).to redirect_to new_user_session_path
  	end

  	it "for creating certification" do
  		certification_attributes = FactoryGirl.attributes_for :certification 
  		expect {
  			post "/certifications", params: { certification: certification_attributes }
  		}.to_not change(Certification, :count)

  		expect(response).to redirect_to new_user_session_path
  	end
  end

  describe "allows logged in user" do
    
    it "to create certification" do
      sign_in
      certification_attributes = FactoryGirl.attributes_for :certification 
      expect {
        post "/certifications", params: { certification: certification_attributes }
      }.to change(Certification, :count).by(1)

      expect(response).to redirect_to(Certification.last)
    end    
  end
end