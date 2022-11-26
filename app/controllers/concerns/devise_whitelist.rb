module DeviseWhitelist
    extend ActiveSupport::Concern

    included do
        before_action :configure_permitted, if: :devise_controller?
    end

    def configure_permitted
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :language])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :language])
    end
end