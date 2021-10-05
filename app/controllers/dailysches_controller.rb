class DailyschesController < ApplicationController
  before_action :set_dailysch, only: %i[ show edit update destroy ]

  # GET /dailysches or /dailysches.json
  def index
    @all_counsellor_names = Dailysch.all.pluck(:counsellor).uniq

    @dailysches = Dailysch.all.order('time asc')
  end

  def grid
    @dailysches = Dailysch.all.order('time asc')

    @counsellors = Dailysch.all.pluck(:counsellor).uniq
    @generated_columns = '[times] 3rem' + @counsellors.map { |item| "[#{item}] 1fr" }.join(' ')

    # ex 9시부터 6시까지 근무 30분 간격
    @day_times = ['times',
                  '0900', '0930', '1000', '1030', '1100', '1130',
                  '1200', '1230', '1300', '1330', '1400', '1430',
                  '1500', '1530', '1600', '1630', '1700', '1730',
                  '1800'
    ]

    # 시간 css 생성
    @generated_rows = @day_times.map do |item|
      "[time-#{item}] 1fr"
    end.join(' ')

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
