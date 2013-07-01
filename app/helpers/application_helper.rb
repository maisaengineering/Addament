module ApplicationHelper
	def profile
		profille = Profile.where(:user_id=> current_user.id).first
  end
  def check_message
    mesage = Receipt.where(receiver_id: current_user.id, mailbox_type: 'inbox', is_read: '0' ).count
  end
  def change_is_read(receipt)
    receipt_is_read = Receipt.find(receipt.id)
    receipt_is_read.update_column(:is_read, '1')
  end
end
