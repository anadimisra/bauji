require "rails_helper"

RSpec.describe LearnersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/learners").to route_to("learners#index")
    end

    it "routes to #show" do
      expect(:get => "/learners/1").to route_to("learners#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/learners/1/edit").to route_to("learners#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/learners").to route_to("learners#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/learners/1").to route_to("learners#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/learners/1").to route_to("learners#update", :id => "1")
    end

  end
end