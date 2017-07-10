json.extract! ticket, :id, :registration_id, :payment_gateway, :payment_gateway_transaction_id, :offer_price, :sale_price, :status, :discount_id, :workshop_id, :learner_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
