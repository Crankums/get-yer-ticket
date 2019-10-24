class Ticket < ApplicationRecord
    belongs_to :customer
    belongs_to :user
    
    # build a limit that limits the number per day
    def started?(ticket)
        ticket.start_time = DateTime.now
        ticket.status = "In Progress"
    end

    def complete?(ticket)
        ticket.status = "Complete"
    end

    
end
