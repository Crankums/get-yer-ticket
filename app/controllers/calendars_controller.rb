class CalendarsController < ApplicationController
    def week
        @tickets = Ticket.all
    end

    def month
        @tickets = Ticket.all
    end

    def day
    end
end
