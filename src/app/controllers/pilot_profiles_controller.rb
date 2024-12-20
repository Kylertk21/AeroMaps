class PilotProfilesController < ApplicationController
  before_action :set_pilot_profile, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authorize_user!, only: %i[ edit update destroy ]

  # GET /pilot_profiles or /pilot_profiles.json
  def index
    @pilot_profiles = PilotProfile.all
  end

  # GET /pilot_profiles/1 or /pilot_profiles/1.json
  def show
  end

  # GET /pilot_profiles/new
  def new
    if current_user.pilot_profile
      redirect_to current_user.pilot_profile, alert: 'You already have a profile'
    else
      @pilot_profile = PilotProfile.new
    end
  end

  # GET /pilot_profiles/1/edit
  def edit
  end

  # POST /pilot_profiles or /pilot_profiles.json
  def create
    if current_user.pilot_profile
      redirect_to current_user.pilot_profile, alert: 'You already have a profile'
    else
      @pilot_profile = current_user.build_pilot_profile(pilot_profile_params)
      respond_to do |format|
      if @pilot_profile.save
        format.html { redirect_to @pilot_profile, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @pilot_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pilot_profile.errors, status: :unprocessable_entity }
      end
    end
  end
end

  # PATCH/PUT /pilot_profiles/1 or /pilot_profiles/1.json
  def update
    respond_to do |format|
      if @pilot_profile.update(pilot_profile_params)
        format.html { redirect_to @pilot_profile, notice: "Pilot profile was successfully updated." }
        format.json { render :show, status: :ok, location: @pilot_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pilot_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pilot_profiles/1 or /pilot_profiles/1.json
  def destroy
    @pilot_profile.destroy!

    respond_to do |format|
      format.html { redirect_to pilot_profiles_path, status: :see_other, notice: "Pilot profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def redirect_to_profile 
    if current_pilot_profile
      redirect_to pilot_profile_path(current_pilot_profile)
    else
      redirect_to new_pilot_profile_path, alert: "Please Create a Profile"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pilot_profile
      @pilot_profile = PilotProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pilot_profile_params
      params.require(:pilot_profile).permit(:first_name, :last_name, :aircraft_ident, :aircraft_type, :home_address, :phone_number, :bio)
    end

    def authorize_user!
      redirect_to root_path, alert: "Invalid User" unless @pilot_profile.user == current_user
    end
end
