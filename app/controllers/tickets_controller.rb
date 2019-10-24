class TicketsController < ApplicationController
    def index
        @tickets = Ticket.all
    end

    def show
        @ticket = Ticket.find(params[:id])
    end

    def new
        @ticket = Ticket.new
    end

    def create
        @ticket = Ticket.build(ticket_params)
        if @ticket.save
            redirect_to ticket_path(@ticket)
        else
            render :new
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
            :paid?
            :user_id,
            :customer_id,
        )
    end
end
