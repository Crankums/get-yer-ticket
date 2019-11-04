class CustomersController < ApplicationController
    before_action :authenticate

    def index
       if params[:search]
        @customers = Customer.search(params[:search])
            if @customers.empty?
                flash[:error] = "Couldn't find that customer, here's the rest of 'em"
                @customers = Customer.all
            end
        else
        @customers = Customer.all
        end
    end

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
        @user = current_user
        if @user.admin
            @customer = Customer.find_by(params[:id])
            @customer.destroy
        flash[:message] = "Custie has been destroyed"
        else
            redirect_to customer_path(@customer)
            flash[:error] = "You cannnot destroy this customer, you are not powerful enough"
        end
    end

    private

    def customer_params
        params.require(:customer).permit(
            :name,
            :email,
            :phone_number,
            :bikes,
            :tickets,
            :search
        )
    end
end
