class Ticket < ApplicationRecord
    belongs_to :customer
    belongs_to :user
    has_one :bike
    # build a limit that limits the number per day
    def started(ticket)
        ticket.work_start = DateTime.now
        ticket.status= "In Progress"
    end

    def paused(ticket)
        ticket.status= "Paused/Awaiting Approval"
    end

    def unpaused(ticket)
        ticket.status= "In Progress"
    end

    def complete_ticket(ticket)
        ticket.status = "Complete"
    end

    # special order functionality? shared with `class Ticket`
        # if `special_order?` checked, approval request is sent to Admin for approval
        #  if approved? s/o status is set to "Approved" => "Ordered" => "Arrived" => "Installed"
    
end
