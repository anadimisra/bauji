class Offer < ApplicationRecord
  belongs_to :discount
  belongs_to :coupon

  validates :available_from, :available_to, presence: true

  validates_date :available_from, :after => lambda { Date.today + 5.days }

  validates_date :available_to, :after => lambda { :offer_should_be_available_atleast_ten_days }

  private

  	def offer_should_be_available_atleast_ten_days
  		available_from.next_day(10)
  	end
end
