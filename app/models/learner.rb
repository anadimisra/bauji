class Learner < ApplicationRecord

	validates :email, uniqueness: true, email: true, on: :create

	validates :first_name, :last_name, presence: true, length: {
		minimum: 1,
		maximum: 50,
		too_long: "We cannot really handle a name longer than %{count} alphabets",
		too_short: "You got to have a name with atleast %{count} alphabet"
	}

	validates :phone_number, :company_name, :job_role, presence: true

end
