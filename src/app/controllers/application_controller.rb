class ApplicationController < ActionController::Base   
    before_action :authenticate_user!
    helper_method :current_pilot_profile
    
    def current_pilot_profile
        @current_pilot_profile ||= current_user.pilot_profile
    end

    private 

    def ensure_pilot_profile
        if current_user && current_user.pilot_profile.nil?
            flash[:alert] = "Please create a profile!"
            redirect_to new_pilot_profile_path and return
        end
    end
    
end
