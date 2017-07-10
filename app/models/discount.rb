class Discount < ApplicationRecord
  belongs_to :workshop
  belongs_to :coupon
end
