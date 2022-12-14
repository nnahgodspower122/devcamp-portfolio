class PortfoliosController < ApplicationController
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
        @porfolio_item = Portfolio.find(params[:id])
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
        @portfolio_item =  Portfolio.find(params[:id])
    end

    def destroy
        #performe the lookup
        @portfolio_item = Portfolio.find(params[:id])

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

end
