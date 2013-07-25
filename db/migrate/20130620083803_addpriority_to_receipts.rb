class AddpriorityToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :priority, :string  , :default => "#FEFF75"
  end
end
