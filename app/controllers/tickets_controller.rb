class TicketsController < ApplicationController
    before_action :authenticate

    def index
        @tickets = Ticket.all
    end

    def show
        @user = current_user
        @ticket = Ticket.find(params[:id])
    end

    def new
        if params[:customer_id]
            @customer = Customer.find_by(params[:customer_id])
        end
        if params[:date]
            @ticket = Ticket.new(check_in: params[:date].to_datetime, 
                                due: params[:date].to_datetime+1.day)
        else
            @ticket = Ticket.new(check_in: DateTime.now, 
                                due: DateTime.now+1.day)
        end
    end

    def create
        @user = current_user   
        if @customer = Customer.find_by(id: params[:customer_id])
            @ticket = @user.tickets.build(ticket_params.except(:bikes, :customers))
            if ticket_params[:bike][:make].empty?
            @ticket.bike = Bike.find_by(id: params[:bike_id])
            else @ticket.bike = Bike.create(ticket_params[:bikes] )
                
            end
        else
            @customer = Customer.new(ticket_params[:customers])
            @ticket = @customer.tickets.build(ticket_params.except(:bikes, :customers))
            @ticket.user = @user
            @ticket.bike = Bike.new(ticket_params[:bikes])
            @customer.bikes << @ticket.bike
            # .build_bike association ^^^
        end
        if @ticket.save
            redirect_to ticket_path(@ticket)
        else
            flash[:error] = @ticket.errors.full_messages
            redirect_to new_ticket_path(@ticket)
        end
    end

    def edit       
        @user = current_user
        @ticket = Ticket.find(params[:id])
        @customer = @ticket.customer    
    end

    def update
        @user = current_user    
        @ticket = Ticket.find(params[:id])
        @customer = @ticket.customer
        if @ticket.update(ticket_params.except(:customers, :bikes))
            redirect_to ticket_path(@ticket)
        else
            flash[:error] = @ticket.errors.full_messages
            render :edit
        end
    end
 
    def delete
        if current_user.admin
            @ticket = Ticket.find(params[:id])
            @ticket.destroy
            redirect_to tickets_path
        else
            flash[:error] = "You must be an admin to delete work orders"
            redirect_to ticket_path(@ticket)
        end
    end

    # def crm
    #     @customer = Customer.find_or_create_by(name: params[:name])
    #     @customer.phone_number= params[:phone_number]
    #     @customer.email= params[:email]
    #     @customer.bikes.build(make: params[:make], model_series: params[:model_series], color: params[:color], size: params[:size])
    #     if @customer.save
    #         redirect_to new_ticket_path
    #     else
    #         render :crm
    #     end
    # end

    private

    def ticket_params
        params.require(:ticket).permit(
            :check_in,
            :work_start,
            :due,
            :status,
            :labor,
            :labor_cost,
            :parts,
            :parts_cost,
            :total_cost,
            :paid?,
            :user_id,
            :customer_id,
            :search,
            :bikes => [:make, :model_series, :color, :size],
            :customers => [:name, :phone_number, :email])
    end
end
