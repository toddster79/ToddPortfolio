class PortfolioSection < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }

    # Where we bring in the concern
    include Placeholder
    validates_presence_of :title, :body, :main_image, :thumb_image

    mount_uploader :thumb_image, PortfolioSectionUploader
    mount_uploader :main_image, PortfolioSectionUploader

    # Create a custom scope
    def self.angular
        where(subtitle: 'Angular')
    end

    def self.by_position
        order("position ASC")
    end

    # Second way to create a custom scope
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

    # Call to set_defaults method 
    after_initialize :set_defaults
    # How to set default values
    def set_defaults
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end  
