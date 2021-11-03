class PortfolioSectionsController < ApplicationController
    def index
        @portfolio_items = PortfolioSection.all 
    end

    def angular
        @angular_portfolio_items = PortfolioSection.angular
    end

    def new 
        @portfolio_item = PortfolioSection.new
        3.times { @portfolio_item.technologies.build }
    end

    def create
        @portfolio_item = PortfolioSection.new(portfolio_section_params)   
    
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
            if @portfolio_item.update(portfolio_section_params)
                format.html { redirect_to portfolio_sections_path, notice: "The record was successfully updated." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def show
        # Controller runs a db query on the model and stores result in the instance variable
        @portfolio_item = PortfolioSection.find(params[:id])
    end

    def destroy
        # Perform the lookup
        @portfolio_item = PortfolioSection.find(params[:id])

        # Destroy/delete the record
        @portfolio_item.destroy

        # Redirect
        respond_to do |format|
            format.html { redirect_to portfolio_sections_url, notice: "Record was removed" }
        end
    end

    private

    def portfolio_section_params
        params.require(:portfolio_section).permit(
            :title, 
            :subtitle, 
            :body,
            technologies_attributes: [:name]
        )
    end

end 
