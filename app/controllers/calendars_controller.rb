class CalendarsController < ApplicationController
    def week_calendar
        @tickets = Ticket.all
    end

    def month_calendar
        @tickets = Ticket.all
    end

    def day
    end
end
