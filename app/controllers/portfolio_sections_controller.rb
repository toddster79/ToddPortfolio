class PortfolioSectionsController < ApplicationController
    def index
        @portfolio_items = PortfolioSection.all 
    end

    def new 
        @portfolio_item = PortfolioSection.new
    end

    def create
        @portfolio_item = PortfolioSection.new(params.require(:portfolio_section).permit(:title, :subtitle, :body))   
    
        respond_to do |format|
            if @portfolio_item.save
                format.html { redirect_to portfolio_sections_path, notice: "Your portfolio item is now live." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end
end 
