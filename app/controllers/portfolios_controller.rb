class PortfoliosController < ApplicationController
    before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
    access all:[:show, :index], user:{except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
    layout "portfolios"

    def index
        @portfolio_item = Portfolio.all
    end

    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_params)
            
            respond_to do |format|
                if @portfolio_item.save
                    format.html {redirect_to portfolios_path, notice: "Your Portfolio is now live"}
                else
                    format.html {render :new}
                end
            end
    end

    def edit
    end

    def update
        @portfolio_item = Portfolio.find(params[:id])
            respond_to do |format|
                if @portfolio_item.update(portfolio_params)
                    format.html { redirect_to portfolio_path, notice: "The record is updated successfully" }
                else
                    format.html { render :edit }
                end
            end
    end

    def show
    end

    def destroy
        #Destroy/delete the record
        @portfolio_item.destroy 

        #Redirect
        respond_to do |format|
            format.html { redirect_to portfolios_path, notice: 'Record has been deleted' }
        end
    end

    private

    def portfolio_params
        params.require(:portfolio).permit(:title,
                                         :subtitle,
                                         :body,
                                         technology_attributes: [:name]
                                         )
    end

    def set_portfolio_item
        @portfolio_item =  Portfolio.find(params[:id])
    end
end
