class FlightPlansController < ApplicationController
  before_action :set_flight_plan, only: %i[ show edit update destroy ]

  # GET /flight_plans or /flight_plans.json
  def index
    @flight_plans = FlightPlan.all
  end

  # GET /flight_plans/1 or /flight_plans/1.json
  def show
  end

  # GET /flight_plans/new
  def new
    @flight_plan = FlightPlan.new
  end

  # GET /flight_plans/1/edit
  def edit
  end

  # POST /flight_plans or /flight_plans.json
  def create
    @flight_plan = FlightPlan.new(flight_plan_params)

    respond_to do |format|
      if @flight_plan.save
        format.html { redirect_to @flight_plan, notice: "Flight plan was successfully created." }
        format.json { render :show, status: :created, location: @flight_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flight_plans/1 or /flight_plans/1.json
  def update
    respond_to do |format|
      if @flight_plan.update(flight_plan_params)
        format.html { redirect_to @flight_plan, notice: "Flight plan was successfully updated." }
        format.json { render :show, status: :ok, location: @flight_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flight_plans/1 or /flight_plans/1.json
  def destroy
    @flight_plan.destroy!

    respond_to do |format|
      format.html { redirect_to flight_plans_path, status: :see_other, notice: "Flight plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight_plan
      @flight_plan = FlightPlan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_plan_params
      params.require(:flight_plan).permit(:departure, :time_of_departure, :route, :cruising_altitude, :true_airspeed, :first_landing, :time_until_first, :fuel_hours, :number_of_passengers, :extra_info)
    end
end
