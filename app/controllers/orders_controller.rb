class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { head :created, content_type: "text/html" }
        format.json { head :created }
      else
        format.html { head :bad_request, content_type: "text/html" }
        format.json { head :bad_request }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Learner was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end    
  end

  # GET /orders/1/edit
  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_id, :gateway_transaction_id, :order_value, :transaction_status, :payment_gateway, :offer_id)
    end  

end
