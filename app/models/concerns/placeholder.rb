module Placeholder
    extend ActiveSupport::Concern

    def self.image_generator(height:, width:)
        "https://designnotes.blog.gov.uk/wp-content/uploads/sites/53/2020/06/Portfolio-Desk.jpg/#{height}*#{width}"
    end
end