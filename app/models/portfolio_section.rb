class PortfolioSection < ApplicationRecord
    has_many :technologies

    accepts_nested_attributes_for :technologies,
                                    allow_destroy: true,
                                    reject_if: lambda { |attrs| attrs['name'].blank? }

    validates_presence_of :title, :body

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

end  

