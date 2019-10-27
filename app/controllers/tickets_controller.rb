class TicketsController < ApplicationController
    before_action :authenticate

    def index
        @tickets = Ticket.all
    end

    def show
        @ticket = Ticket.find(params[:id])
    end

    def new
        if params[:date]
            @ticket = Ticket.new(check_in: params[:date].to_datetime, due: params[:date].to_datetime+1.day)
        else
            @ticket = Ticket.new(check_in: DateTime.now, due: DateTime.now+1.day)
        end
    end

    def create
        binding.pry

        @user = current_user
        @ticket = @user.tickets.build(ticket_params)
        if @ticket.save
            redirect_to ticket_path(@ticket)
        else
            flash[:error] = @ticket.errors.full_messages
            redirect_to new_ticket_path(@ticket)
        end
    end

    def edit
        @ticket = Ticket.find(params[:id])
    end

    def update
        @ticket = Ticket.find(params[:id])
        if @ticket.update(ticket_params)
            redirect_to ticket_path(@ticket)
        else
            render :new
        end
    end
 
    def delete
        @ticket = Ticket.find(params[:id])
        redirect_to tickets_path
    end

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
        )
    end
end
