class CustomersController < ApplicationController
    
    def show
        @customer = Customer.find(params[:id])
    end

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.build(customer_params)
        if @customer.save
            redirect_to customer_path(@customer)
        else
            render :new
        end
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])
        if customer.save
            redirect_to customer_path(@customer)
        else
            render :edit
        end
    end

    def delete
        @customer = Customer.find_by(params[:id])
        @customer.destroy
    end

    private

    def customer_params
        params.require(:customer).permit(
            :name,
            :email,
            :phone_number
            :bikes,
            :tickets
        )
    end
end
