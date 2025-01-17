class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, if: :skip_user_authentication
  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_by_voucher_code
    coupon = Coupon.find_by voucher_code: params[:voucher_code]
    available_discounts = []
    Offer.where('coupon_id = :coupon_id AND available_limit > 0 AND :today BETWEEN available_from AND available_to', coupon_id: coupon[:id], today: Date.today).find_each do |offer|
      available_discount = AvailableDiscount.new
      available_discount.voucher_code = coupon[:voucher_code]
      available_discount.discount = offer.discount[:discount_percentage]
      available_discounts << available_discount
    end
    if available_discounts.size > 0
      render json: available_discounts, status: :ok
    else
      head :not_found
    end
  end

  protected
    def skip_user_authentication
        action_name.eql?('get_by_voucher_code')
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:available_from, :available_to, :available_limit, :discount_id, :coupon_id)
    end
end
