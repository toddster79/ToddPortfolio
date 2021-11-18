class AddPositionToPortfolioSections < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolio_sections, :position, :integer
  end
end
