class Skill < ApplicationRecord
    # Where we pull the concern in
    include Placeholder
    validates_presence_of :title, :percent_utilized

    after_initialize :set_defaults
    # How to set default values
    def set_defaults
        self.badge ||= Placeholder.image_generator(height: '250', width: '250')
    end
end
