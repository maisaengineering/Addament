module ApplicationHelper
	def profile
		profille = Profile.where(:user_id=> current_user.id).first
  end
  def check_message
    mesage = Receipt.where(receiver_id: current_user.id, is_read: '1' ).count
  end
end
