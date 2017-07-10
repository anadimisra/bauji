class Workshop < ApplicationRecord
  belongs_to :certification
  has_many :tickets
  has_many :learners, through: :tickets
  has_many :discounts

end
