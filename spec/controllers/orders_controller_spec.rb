require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

 let(:valid_attributes) {
    FactoryGirl.build(:order).serializable_hash
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:order, order_value: 34000.00).serializable_hash
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "returns a success response" do
      order = Order.create! valid_attributes
      get :show, params: {id: order.to_param}, session: valid_session
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      order = Order.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Order" do
        expect {
          post :create, params: {order: valid_attributes}, session: valid_session
        }.to change(Order, :count).by(1)
      end

      it "sends a http 201 created status without redirect" do
        post :create, params: {order: valid_attributes}, session: valid_session
        expect(response.status).to eq 201
      end
    end

    context "with invalid params" do
      it "returns a http 400 bad request response" do
        post :create, params: {order: invalid_attributes}, session: valid_session
        expect(response.status).to eq 400
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.build(:order, transaction_status: "success").serializable_hash
      }

      it "updates the requested order" do
        order = Order.create! valid_attributes
        put :update, params: {id: order.to_param, order: new_attributes}, session: valid_session
        order.reload
        expect(order.transaction_status).to eql "success"
      end

      it "redirects to the order" do
        order = Order.create! valid_attributes
        put :update, params: {id: order.to_param, order: new_attributes}, session: valid_session
        expect(response).to redirect_to(order)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        order = Order.create! valid_attributes
        put :update, params: {id: order.to_param, order: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      order = Order.create! valid_attributes
      get :edit, params: {id: order.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

end