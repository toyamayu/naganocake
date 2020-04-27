class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        case resource
        when Admin
          admin_items_path
        when EndUser
          public_end_user_path(resource)
        end
    end

    def after_sign_out_path_for
        case
        when Admin
            new_admin_session_path
        when EndUser
            root_parh
        end
    end

    
    private

    def configure_permitted_parameters
        case
        when EndUser
            devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
        end
    end
    




end
