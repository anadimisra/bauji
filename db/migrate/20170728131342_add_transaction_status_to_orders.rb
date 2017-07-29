class AddTransactionStatusToOrders < ActiveRecord::Migration[5.1]
  def up
  	ActiveRecord::Base.connection.execute <<~SQL
      CREATE TYPE transaction_status AS ENUM ('Initiated', 'Success', 'Failed');
    SQL

    add_column :orders, :transaction_status, :transaction_status, index: true
  end

  def down
  	remove_column :orders, :transaction_status

  	ActiveRecord::Base.connection.execute <<~SQL
      DROP TYPE transaction_status;
    SQL
  end
end
