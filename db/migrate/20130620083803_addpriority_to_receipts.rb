class AddpriorityToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :priority, :string
  end
end
