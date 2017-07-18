class Certification < ApplicationRecord
	#extend FriendlyId

	has_many :workshops

	validates :name, presence: true, length: {
		minimum: 10,
		maximum: 80,
		too_long: "Too long! %{count} characters is the maximum allowed",
		too_short: "Too short! has to be atleast %{count} characters" 
	}

	validates :description, :terms, :seo_meta_keywords, :seo_meta_description, presence: true

	#friendly_id :name, use: :slugged
end
