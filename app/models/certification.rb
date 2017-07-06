class Certification < ApplicationRecord
	#extend FriendlyId
	resourcify

	validates	:name, presence: true, length: {
		minimum: 10,
		maximum: 100,
		too_long: "%{count} characters is the maximum allowed",
		too_short: "Should be more than or equal to %{count} chatacters"
	}

	validates :city, presence: true, length: {
		minimum: 4,
		maximum: 50,
		too_long: "%{count} characters is the maximum allowed",
		too_short: "Should be more than or equal to %{count} chatacters"
	}

	validates :venue, presence: true, length: {
		minimum: 8,
		maximum: 50,
		too_long: "%{count} characters is the maximum allowed",
		too_short: "Should be more than or equal to %{count} chatacters"
	}

	validates :seats, numericality: { 
		only_integer: true ,
		greater_than_or_equal_to: 10,
		less_than_or_equal_to: 25
	}

	validates :venue_map_link, presence: true
	validates :venue_map_link, format: { with: URI.regexp }

	validates :dates, :schedule, :unit_price, :description, :terms, :seo_meta_keywords, :seo_meta_description, presence: true
 
	# TODO Date Range and Time Range Validator
	# Friendly ID Breaks Tests
	#friendly_id :slug_candidates, use: :slugged

	#def slug_candidates
	#	[ :name, :city, :dates ]
	#end
end
