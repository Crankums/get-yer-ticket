class Ticket < ApplicationRecord
    belongs_to :customer
    belongs_to :user
    has_one :bike
    # build a limit that limits the number per day
    def started?(ticket)
        ticket.work_start = DateTime.now
        ticket.status = "In Progress"
    end

    def complete?(ticket)
        ticket.status = "Complete"
    end

    
end
