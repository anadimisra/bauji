class Offer < ApplicationRecord
  belongs_to :discount
  belongs_to :coupon

  validates :available_from, :available_to, presence: true

  validates_date :available_from, :after => :offers_start_atleast_five_days_from_today, 
  																:after_message => "We need atleast five days to market a new Offer, choose date accordingly"

  validates_date :available_to, :after => :offer_should_be_available_atleast_ten_days, 
  															:after_message => "It's wise to keep an offer for atleast ten days, choose date accrodingly"

  private

  	def offers_start_atleast_five_days_from_today
  		Date.today.next_day(5)
  	end

  	def offer_should_be_available_atleast_ten_days
  		available_from.next_day(10)
  	end
end
