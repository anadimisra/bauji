json.extract! coupon, :id, :name, :voucher_code, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
