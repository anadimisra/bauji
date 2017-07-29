class Registration < ApplicationRecord
  belongs_to :learner
  belongs_to :workshop
  belongs_to :order
end
