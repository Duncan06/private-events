class ApplicationController < ActionController::Base

    # before_filter :require_login

    helper_method :current_user
    helper_method :require_login

    private

    def current_user
        @_current_user ||=session[:current_user_id] &&
        User.find_by(id: session[:current_user_id])
    end

    def require_login
        unless current_user
            redirect_to root_url
        end
    end
end
