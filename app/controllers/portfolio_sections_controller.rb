class PortfolioSectionsController < ApplicationController
    def index
        @portfolio_items = PortfolioSection.all 
    end
end
