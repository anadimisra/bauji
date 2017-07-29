class Coupon < ApplicationRecord

		validates :name, presence: true, length: {
			minimum: 10,
			maximum: 50,
			too_long: "Too long a description! %{count} characters is the maximum allowed",
			too_short: "Too short a description! has to be atleast %{count} characters" 
		}

		validates :voucher_code, presence: true, length: {
			minimum: 5,
			maximum: 10,
			too_long: "Too long for voucher code! %{count} characters is the maximum allowed",
			too_short: "Too short for voucher code! has to be atleast %{count} characters" 
		}

end
