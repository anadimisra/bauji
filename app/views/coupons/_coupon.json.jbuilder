json.extract! coupon, :id, :code, :percentage, :max_value, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
