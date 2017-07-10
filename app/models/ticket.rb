class Ticket < ApplicationRecord
  belongs_to :workshop
  belongs_to :learner
  belongs_to :discount
end
