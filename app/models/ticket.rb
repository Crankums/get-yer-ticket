class Ticket < ApplicationRecord
    belongs_to :customer
    belongs_to :user
    has_one :bike
    accepts_nested_attributes_for :customer
    accepts_nested_attributes_for :bike

    validates :parts, format: {:with => /\A[A-Za-z0-9 ]+\z/ }
    validates :labor, format: {:with => /\A[A-Za-z0-9 ]+\z/ }
    validates :due, presence: true
    validates :check_in, presence: true
          
    # scope :past_due, -> {where(:due < DateTime.now)}
    
    def total_cost
        self.parts_cost + self.labor_cost
    end

    # build a limit that limits the number per day <- scope method
    def checked_in
        self.check_in= DateTime.now
    end
    
    def started
        self.work_start= DateTime.now
    end

    def paused
        self.status= "Paused/Awaiting Approval"
    end

    def complete_ticket
        self.status = "Complete"
    end    
end
