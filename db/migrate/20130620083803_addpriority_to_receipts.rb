class AddpriorityToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :priority, :string  , :default => "#2a7fec"
  end
end
