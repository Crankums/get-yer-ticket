class Ticket < ApplicationRecord
    belongs_to :customer
    belongs_to :user
    has_one :bike
    has_many :customer_tickets

    validates_format_of :parts, :labor, :with => /\A[a-z0-9]+\z/
    validates_presence_of :due
    validates :status, inclusion: { in: %w(Open InProgress Paused/AwaitingApproval Complete)}
    
    # build a limit that limits the number per day
    def checked_in(ticket)
        ticket.check_in= DateTime.now
    end
    
    def started(ticket)
        if !ticket.work_start 
            ticket.work_start= DateTime.now
        end
        ticket.status= "InProgress"
    end

    def paused(ticket)
        ticket.status= "Paused/AwaitingApproval"
    end

    def complete_ticket(ticket)
        ticket.status = "Complete"
    end

    # special order functionality? shared with `class Ticket`
        # if `special_order?` checked, approval request is sent to Admin for approval
        #  if approved? s/o status is set to "Approved" => "Ordered" => "Arrived" => "Installed"
    
end
