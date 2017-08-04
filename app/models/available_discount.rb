class AvailableDiscount
	include ActiveModel::Model
	include ActiveModel::Serializers::JSON

	attr_accessor :voucher_code, :discount

	def attributes
    { 'voucher_code' => nil, 'discount' => nil }
  end
end