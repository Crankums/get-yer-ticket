class CustomerTicket < ApplicationRecord
    belongs_to :user
    belongs_to :ticket

    # this will allow customer to see their own tickets, in list and individual format, but with no admin notes 
end
