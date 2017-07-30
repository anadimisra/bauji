class Certification < ApplicationRecord
	extend FriendlyId

	has_many :workshops, validate: false

	friendly_id :name, use: :slugged

	validates :name, presence: true, length: {
		minimum: 10,
		maximum: 80,
		too_long: "Too long! %{count} characters is the maximum allowed",
		too_short: "Too short! has to be atleast %{count} characters" 
	}

	validates :description, :terms, :seo_meta_keywords, :seo_meta_description, presence: true

	before_update :do_not_allow_name_to_be_updated

	private

		def do_not_allow_name_to_be_updated
			if self.name_changed?
				errors.add(:name, "Can't be changed once set")
				return false
			end
		end

end
