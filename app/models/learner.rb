class Learner < ApplicationRecord
	has_many :tickets
	has_many :workshops, through: :tickets
end
