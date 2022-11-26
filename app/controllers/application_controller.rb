class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include DeviseWhitelist
    include SetSource
    include CurrentUserConcern
    include DefaultPageContent
    before_action :set_copyright
    before_action :set_locale

    def set_locale
        if user_signed_in?
            I18n.locale = current_user.language
        else
            I18n.locale = params[:lang] || locale_from_header || I18n.default_locale
        end
    end

    def locale_from_header
        request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
    end

    def set_copyright
        @copyright = DevcampViewTool::Render.copyright 'Jordan Hudgens', 'All rights reserved'
    end

end

module DevcampViewTool
    class Render
        def self.copyright name, msg
            "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
        end
    end
end
