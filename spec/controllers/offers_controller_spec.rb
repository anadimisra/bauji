require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe OffersController, type: :controller do

  # Login before all actions 
  login_user

  # This should return the minimal set of attributes required to create a valid
  # Offer. As you add validations to Offer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.build(:offer).serializable_hash
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:offer, available_to: nil).serializable_hash
  }

  let(:valid_end_date){
    Date.today.next_day(20)
  }

  describe "GET #index" do
    it "returns a success response" do
      offer = Offer.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      offer = Offer.create! valid_attributes
      get :show, params: {id: offer.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      offer = Offer.create! valid_attributes
      get :edit, params: {id: offer.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Offer" do
        expect {
          post :create, params: {offer: valid_attributes}
        }.to change(Offer, :count).by(1)
      end

      it "redirects to the created offer" do
        post :create, params: {offer: valid_attributes}
        expect(response).to redirect_to(Offer.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {offer: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested offer" do
        offer = Offer.create! valid_attributes
        offer.available_to = valid_end_date
        put :update, params: { id: offer.to_param, offer: offer.serializable_hash }
        offer.reload
        expect(offer.available_to).to eq valid_end_date
      end

      it "redirects to the offer" do
        offer = Offer.create! valid_attributes
        offer.available_limit -= 1
        put :update, params: { id: offer.to_param, offer: offer.serializable_hash }
        expect(response).to redirect_to(offer)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        offer = Offer.create! valid_attributes
        offer.available_to = nil
        put :update, params: { id: offer.to_param, offer: offer.serializable_hash }
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested offer" do
      offer = Offer.create! valid_attributes
      expect {
        delete :destroy, params: {id: offer.to_param}
      }.to change(Offer, :count).by(-1)
    end

    it "redirects to the offers list" do
      offer = Offer.create! valid_attributes
      delete :destroy, params: {id: offer.to_param}
      expect(response).to redirect_to(offers_url)
    end
  end

end
