class ApplicationController < ActionController::Base   
    before_action :authenticate_user!
    
    def current_pilot_profile
        current_user.pilot_profile
    end
    
end
