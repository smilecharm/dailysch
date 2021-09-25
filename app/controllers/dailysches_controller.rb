class DailyschesController < ApplicationController
  before_action :set_dailysch, only: %i[ show edit update destroy ]

  # GET /dailysches or /dailysches.json
  def index
    @dailysches = Dailysch.all.order('time asc').group_by(&:time)
  end

  # GET /dailysches/1 or /dailysches/1.json
  def show
  end

  # GET /dailysches/new
  def new
    @dailysch = Dailysch.new
  end

  # GET /dailysches/1/edit
  def edit
  end

  # POST /dailysches or /dailysches.json
  def create
    @dailysch = Dailysch.new(dailysch_params)

    respond_to do |format|
      if @dailysch.save
        format.html { redirect_to @dailysch, notice: "Dailysch was successfully created." }
        format.json { render :show, status: :created, location: @dailysch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dailysch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dailysches/1 or /dailysches/1.json
  def update
    respond_to do |format|
      if @dailysch.update(dailysch_params)
        format.html { redirect_to @dailysch, notice: "Dailysch was successfully updated." }
        format.json { render :show, status: :ok, location: @dailysch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dailysch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dailysches/1 or /dailysches/1.json
  def destroy
    @dailysch.destroy
    respond_to do |format|
      format.html { redirect_to dailysches_url, notice: "Dailysch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dailysch
      @dailysch = Dailysch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dailysch_params
      params.require(:dailysch).permit(:date, :counsellor, :time, :client, :ref)
    end
end
