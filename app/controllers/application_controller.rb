class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        user_path(resource)
    end

    def after_sign_up_path_for(resource)
        user_path(resource)
    end

    def after_sign_out_path_for(resource_or_scope)
        new_user_session_path
    end
end
