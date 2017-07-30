class JobPost < ApplicationRecord
	extend FriendlyId
	resourcify

	friendly_id :name, use: :slugged
	
	validates :name, presence: true, length: {
		minimum: 10,
		maximum: 50,
		too_long: "%{count} characters is the maximum allowed",
		too_short: "Should be more than or equal to %{count} chatacters"
	}

	validates :location, presence: true, length: {
		minimum: 4,
		maximum: 50,
		too_long: "%{count} characters is the maximum allowed",
		too_short: "Should be more than or equal to %{count} chatacters"
	}

	validates :experience, :description, :skills, :active, :seo_meta_keywords, :seo_meta_description, presence: true
	
	
end
