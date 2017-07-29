class Offer < ApplicationRecord
  belongs_to :discount
  belongs_to :coupon

  validates :available_from, :available_to, presence: true

  validates_date :available_from, :after => lambda { Date.today + 5.days }

  validates_date :available_to, :after => lambda { :available_from + 10.days }

end
