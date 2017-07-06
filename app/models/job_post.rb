class JobPost < ApplicationRecord
	#extend FriendlyId
	resourcify

	#friendly_id :name, use: :slugged
end
