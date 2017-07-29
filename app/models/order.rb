class Order < ApplicationRecord
	has_many :registrations
	belongs_to :offer, optional: true

	enum transaction_status: {
    init: 'Initiated',
    success: 'Success',
    fail: 'Failed'
  }

  enum payment_gateway: {
  	ccavenue: 'CCAvenue',
  	instamojo: 'Instamojo',
  	payumoney: 'PayUMoney',
  	razorpay: 'RazorPay',
  	paypal: 'PayPal',
  	stripe: 'Stripe'
  }

  validates :order_value, presence: true, numericality: {
    greater_than_or_equal_to: 40000.00
  }

end
