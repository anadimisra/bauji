require 'rails_helper'

RSpec.describe "JobPosts", type: :request do
  describe "JSON request" do

    it "lists all vacancies without authentication" do
    	FactoryGirl.create(:job_post)
      get "/job_posts.json"
      expect(response).to be_success
    end

    it "lists a vacancies without authentication" do
    	job = FactoryGirl.create(:job_post)
  		get "/job_posts/"<<job.id.to_s<<".json"
    	expect(response).to be_success
    	expect(json['name']).to eql job.name
    end
  end

  describe "denies public access" do

  	it "to new vacancy form" do
  		get new_job_post_path
  		expect(response).to redirect_to new_user_session_path
  	end

  	it "for creating vacancy" do
  		job_attributes = FactoryGirl.attributes_for :job_post 
  		expect {
  			post "/job_posts", params: { job_post: job_attributes }
  		}.to_not change(JobPost, :count)

  		expect(response).to redirect_to new_user_session_path
  	end
  end

  describe "allows logged in user" do

    it "to create vacancy" do
      sign_in
  		job_attributes = FactoryGirl.attributes_for :job_post 
  		expect {
  			post "/job_posts", params: { job_post: job_attributes }
  		}.to change(JobPost, :count).by(1)

      expect(response).to redirect_to(JobPost.last)
    end    
  end
end
