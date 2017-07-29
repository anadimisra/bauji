class Discount < ApplicationRecord

	validates :registration_quantity, presence: true, numericality: {
		only_integer: true, 
		greater_than_or_equal_to: 1,
		less_than_or_equal_to: 5
	}

	validates :discount_value, presence: true, numericality: {
		greater_than_or_equal_to: 100.00,
		less_than_or_equal_to: 9000.00
	}

	validates :discount_percentage, presence: true, numericality: {
		greater_than_or_equal_to: 0.05,
		less_than_or_equal_to: 0.25
	}	
	
end
