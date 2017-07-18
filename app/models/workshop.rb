class Workshop < ApplicationRecord
  belongs_to :certification
  has_many :registrations
  has_many :learners, through: :registrations
end