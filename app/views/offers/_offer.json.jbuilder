json.extract! offer, :id, :available_from, :available_to, :discount_id, :coupon_id, :created_at, :updated_at
json.url offer_url(offer, format: :json)
