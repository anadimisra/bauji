require 'rails_helper'

RSpec.describe LearnersController, type: :controller do

 let(:valid_attributes) {
    FactoryGirl.build(:learner).serializable_hash
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:learner, last_name: "").serializable_hash
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "returns a success response" do
      learner = Learner.create! valid_attributes
      get :show, params: {id: learner.to_param}, session: valid_session
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns a success response" do
      learner = Learner.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Learner" do
        expect {
          post :create, params: {learner: valid_attributes}, session: valid_session
        }.to change(Learner, :count).by(1)
      end

      it "sends a http 201 created status without redirect" do
        post :create, params: {learner: valid_attributes}, session: valid_session
        expect(response.status).to eq 201
      end
    end

    context "with invalid params" do
      it "returns a http 400 bad request response" do
        post :create, params: {learner: invalid_attributes}, session: valid_session
        expect(response.status).to eq 400
      end
    end    
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.build(:learner, middle_name: "Mahesh").serializable_hash
      }

      it "updates the requested learner" do
        learner = Learner.create! valid_attributes
        put :update, params: {id: learner.to_param, learner: new_attributes}, session: valid_session
        learner.reload
        expect(learner.middle_name).to eql("Mahesh")
      end

      it "redirects to the learner" do
        learner = Learner.create! valid_attributes
        put :update, params: {id: learner.to_param, learner: valid_attributes}, session: valid_session
        expect(response).to redirect_to(learner)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        learner = Learner.create! valid_attributes
        put :update, params: {id: learner.to_param, learner: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      learner = Learner.create! valid_attributes
      get :edit, params: {id: learner.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

end
