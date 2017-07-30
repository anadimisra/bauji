class LearnersController < ApplicationController
  before_action :set_learner, only: [:show, :edit, :update]

  # GET /learners/1
  # GET /learners/1.json
  def show
  end

  # GET /learners
  # GET /learners.json
  def index
    @learners = Learner.all
  end

  # POST /learners
  # POST /learners.json
  def create
    @learner = Learner.new(learner_params)

    respond_to do |format|
      if @learner.save
        format.html { head :created, content_type: "text/html" }
        format.json { head :created, location: @order }
      else
        format.html { head :bad_request, content_type: "text/html" }
        format.json { head :bad_request }
      end
    end
  end

  # PATCH/PUT /learners/1
  # PATCH/PUT /learners/1.json
  def update
    respond_to do |format|
      if @learner.update(learner_params)
        format.html { redirect_to @learner, notice: 'Learner was successfully updated.' }
        format.json { head :ok, location: @learner }
      else
        format.html { render :edit }
        format.json { render json: @learner.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /learners/1/edit
  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learner
      @learner = Learner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learner_params
      params.require(:learner).permit(:email, :first_name, :middle_name, :last_name, :phone_number, :company_name, :job_role, :certifications)
    end
end
