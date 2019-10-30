class CalendarsController < ApplicationController
    def week
        @tickets = Ticket.all
    end

    def month
        @tickets = Ticket.all
    end

    def today
        @tickets = Ticket.all
    end
end
