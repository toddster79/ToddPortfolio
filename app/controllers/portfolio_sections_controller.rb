class PortfolioSectionsController < ApplicationController
    before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
    access  all: [:show, :index, :angular], 
            user: {except: [:destroy, :new, :create, :update, :edit, :sort]},
            site_admin: :all
    layout 'portfolio_section'
    
    def index
        @portfolio_items = PortfolioSection.by_position
    end

    def sort
        params[:order].each do |key, value|
            PortfolioSection.find(value[:id]).update(position: value[:position])
        end

        render nothing: true
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
    end

    def update
        respond_to do |format|
            if @portfolio_item.update(portfolio_section_params)
                format.html { redirect_to portfolio_sections_path, notice: "The record was successfully updated." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def show
    end

    def destroy
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
            :main_image,
            :thumb_image,
            technologies_attributes: [:name]
        )
    end

    def set_portfolio_item
        @portfolio_item = PortfolioSection.find(params[:id])
    end

end 
