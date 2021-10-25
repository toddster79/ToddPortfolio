class PortfolioSection < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    # Create a custom scope
    def self.angular
        where(subtitle: 'Angular')
    end

    # Second way to create a custom scope
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

    # Call to set_defaults method 
    after_initialize :set_defaults
    # How to set default values
    def set_defaults
        self.main_image ||= "https://via.placeholder.com/600x400"
        self.thumb_image ||= "https://via.placeholder.com/350x200"
    end
end
