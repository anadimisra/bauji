class AddPaymentGatewayToOrders < ActiveRecord::Migration[5.1]
  def up
  	ActiveRecord::Base.connection.execute <<~SQL
      CREATE TYPE payment_gateway AS ENUM ('CCAvenue', 'Instamojo', 'PayUMoney', 'RazorPay', 'PayPal', 'Stripe');
    SQL

    add_column :orders, :payment_gateway, :payment_gateway, index: true
  end

  def down
  	remove_column :orders, :payment_gateway

  	ActiveRecord::Base.connection.execute <<~SQL
      DROP TYPE payment_gateway;
    SQL
  end
end
