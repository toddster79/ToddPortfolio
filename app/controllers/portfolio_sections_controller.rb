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

    def edit
        @portfolio_item = PortfolioSection.find(params[:id])
    end

    def update
        @portfolio_item = PortfolioSection.find(params[:id])

        respond_to do |format|
            if @portfolio_item.update(params.require(:portfolio_section).permit(:title, :subtitle, :body))
                format.html { redirect_to portfolio_sections_path, notice: "The record was successfully updated." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def show
        @portfolio_item = PortfolioSection.find(params[:id])
    end

end 
