class AddpriorityToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :priority, :string  , :default => "#FFFF00"
  end
end
