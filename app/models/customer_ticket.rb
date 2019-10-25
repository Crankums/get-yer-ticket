class CustomerTicket < ApplicationRecord
    belongs_to :ticket
    belongs_to :customer

    # this will allow customer to see their own tickets, in list and individual format, but with no admin notes 
end
